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

      Navigator.pop(context); // Öğrenci menüsüne geri dön
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
      appBar: AppBar(title: const Text('Çalışmak İçin Ders Ekle')),
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
                controller: _calismaSuresiController,
                decoration:
                    const InputDecoration(labelText: 'Çalışma Süresi (Saat)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Lütfen çalışma süresi girin' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _dersEkle,
                child: const Text('Ders Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
