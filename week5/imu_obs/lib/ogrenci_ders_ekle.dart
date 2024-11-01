import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciDersEkle extends StatefulWidget {
  final Ogrenci ogrenci;

  OgrenciDersEkle({required this.ogrenci});

  @override
  _OgrenciDersEkleState createState() => _OgrenciDersEkleState();
}

class _OgrenciDersEkleState extends State<OgrenciDersEkle> {
  final _formKey = GlobalKey<FormState>();
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _calismaSuresiController = TextEditingController();

  void _dersEkle() {
    if (_formKey.currentState!.validate()) {
      widget.ogrenci.dersler.add({
        'dersKodu': _dersKoduController.text,
        'dersAdi': _dersAdiController.text,
        'calismaSuresi': int.parse(_calismaSuresiController.text),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('${_dersAdiController.text} başarıyla eklendi!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _dersKoduController.dispose();
    _dersAdiController.dispose();
    _calismaSuresiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışmak İçin Ders Ekle'),
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
                  controller: _calismaSuresiController,
                  decoration: const InputDecoration(
                    labelText: 'Çalışma Süresi (Saat)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Lütfen çalışma süresi girin' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _dersEkle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 39, 137, 157),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Ders Ekle',
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
