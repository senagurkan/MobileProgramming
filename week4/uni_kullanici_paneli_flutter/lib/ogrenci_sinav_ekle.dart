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

      Navigator.pop(context); // Öğrenci menüsüne geri dön
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
      appBar: AppBar(title: const Text('Sınav Olacak Tarih Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dersKoduController,
                decoration: const InputDecoration(labelText: 'Ders Kodu'),
                validator: (value) =>
                    value!.isEmpty ? 'Lütfen ders kodu girin' : null,
              ),
              TextFormField(
                controller: _dersAdiController,
                decoration: const InputDecoration(labelText: 'Ders Adı'),
                validator: (value) =>
                    value!.isEmpty ? 'Lütfen ders adı girin' : null,
              ),
              TextFormField(
                controller: _sinavTarihiController,
                decoration: const InputDecoration(
                    labelText: 'Sınav Tarihi (YYYY-MM-DD)'),
                validator: (value) =>
                    value!.isEmpty ? 'Lütfen sınav tarihini girin' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _sinavEkle,
                child: const Text('Sınav Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
