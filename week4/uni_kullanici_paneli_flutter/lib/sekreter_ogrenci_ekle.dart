import 'package:flutter/material.dart';
import 'models/ogrenci.dart';
import 'models/sekreter.dart';

class SekreterOgrenciEkle extends StatefulWidget {
  final Sekreter sekreter;

  SekreterOgrenciEkle({required this.sekreter});

  @override
  _SekreterOgrenciEkleState createState() => _SekreterOgrenciEkleState();
}

class _SekreterOgrenciEkleState extends State<SekreterOgrenciEkle> {
  final _isimController = TextEditingController();
  final _soyisimController = TextEditingController();

  @override
  void dispose() {
    _isimController.dispose();
    _soyisimController.dispose();
    super.dispose();
  }

  void _ogrenciEkle() {
    if (_isimController.text.isNotEmpty && _soyisimController.text.isNotEmpty) {
      final ogrenci = Ogrenci(
        _isimController.text,
        _soyisimController.text,
      );

      widget.sekreter.ogrenciEkle(ogrenci);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${ogrenci.isim} ${ogrenci.soyisim} eklendi!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Öğrenci Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _isimController,
              decoration: const InputDecoration(labelText: 'Öğrenci İsmi'),
            ),
            TextField(
              controller: _soyisimController,
              decoration: const InputDecoration(labelText: 'Öğrenci Soyismi'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _ogrenciEkle,
              child: const Text('Öğrenci Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
