import 'package:flutter/material.dart';
import 'models/hoca.dart';
import 'models/sekreter.dart';

class SekreterHocaEkle extends StatefulWidget {
  final Sekreter sekreter;

  SekreterHocaEkle({required this.sekreter});

  @override
  _SekreterHocaEkleState createState() => _SekreterHocaEkleState();
}

class _SekreterHocaEkleState extends State<SekreterHocaEkle> {
  final _isimController = TextEditingController();
  final _soyisimController = TextEditingController();

  @override
  void dispose() {
    _isimController.dispose();
    _soyisimController.dispose();
    super.dispose();
  }

  void _hocaEkle() {
    if (_isimController.text.isNotEmpty && _soyisimController.text.isNotEmpty) {
      final hoca = Hoca(
        _isimController.text,
        _soyisimController.text,
      );

      widget.sekreter.hocaEkle(hoca);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${hoca.isim} ${hoca.soyisim} eklendi!')),
      );

      Navigator.pop(context); // Sekreter menüsüne geri dön
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hoca Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _isimController,
              decoration: const InputDecoration(labelText: 'Hoca İsmi'),
            ),
            TextField(
              controller: _soyisimController,
              decoration: const InputDecoration(labelText: 'Hoca Soyismi'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hocaEkle,
              child: const Text('Hoca Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
