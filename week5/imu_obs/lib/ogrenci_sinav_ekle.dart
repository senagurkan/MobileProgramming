import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciSinavEkle extends StatefulWidget {
  final Ogrenci ogrenci;

  OgrenciSinavEkle({required this.ogrenci});

  @override
  _OgrenciSinavEkleState createState() => _OgrenciSinavEkleState();
}

class _OgrenciSinavEkleState extends State<OgrenciSinavEkle> {
  final _formKey = GlobalKey<FormState>();
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _sinavTarihiController = TextEditingController();

  void _sinavEkle() {
    if (_formKey.currentState!.validate()) {
      widget.ogrenci.sinavlar.add({
        'dersKodu': _dersKoduController.text,
        'dersAdi': _dersAdiController.text,
        'sinavTarihi': _sinavTarihiController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_dersAdiController.text} sınavı eklendi!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _dersKoduController.dispose();
    _dersAdiController.dispose();
    _sinavTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınav Olacak Tarih Ekle'),
        backgroundColor:
            const Color.fromARGB(255, 220, 235, 245), // Light blue tone
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color.fromARGB(255, 230, 240, 250)
            ], // White to light blue gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _dersKoduController,
                  decoration: const InputDecoration(
                    labelText: 'Ders Kodu',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Lütfen ders kodu girin' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dersAdiController,
                  decoration: const InputDecoration(
                    labelText: 'Ders Adı',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Lütfen ders adı girin' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _sinavTarihiController,
                  decoration: const InputDecoration(
                    labelText: 'Sınav Tarihi (YYYY-MM-DD)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Lütfen sınav tarihini girin' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _sinavEkle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 39, 137, 157),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sınav Ekle',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
