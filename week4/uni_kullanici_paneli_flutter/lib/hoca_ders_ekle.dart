import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaDersEkle extends StatefulWidget {
  final Hoca hoca;

  HocaDersEkle({required this.hoca});

  @override
  _HocaDersEkleState createState() => _HocaDersEkleState();
}

class _HocaDersEkleState extends State<HocaDersEkle> {
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _haftalikSaatController = TextEditingController();

  void _dersEkle() {
    if (_dersKoduController.text.isNotEmpty &&
        _dersAdiController.text.isNotEmpty &&
        _haftalikSaatController.text.isNotEmpty) {
      widget.hoca.dersEkle(
        Ders(
          _dersKoduController.text,
          _dersAdiController.text,
          int.parse(_haftalikSaatController.text),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_dersAdiController.text} eklendi!')),
      );

      Navigator.pop(context); // Geri dön
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ders Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dersKoduController,
              decoration: const InputDecoration(labelText: 'Ders Kodu'),
            ),
            TextField(
              controller: _dersAdiController,
              decoration: const InputDecoration(labelText: 'Ders Adı'),
            ),
            TextField(
              controller: _haftalikSaatController,
              decoration: const InputDecoration(labelText: 'Haftalık Saat'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _dersEkle,
              child: const Text('Ders Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
