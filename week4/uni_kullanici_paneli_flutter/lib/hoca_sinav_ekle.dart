import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaSinavEkle extends StatefulWidget {
  final Hoca hoca;

  HocaSinavEkle({required this.hoca});

  @override
  _HocaSinavEkleState createState() => _HocaSinavEkleState();
}

class _HocaSinavEkleState extends State<HocaSinavEkle> {
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _sinavTarihiController = TextEditingController();
  String? _sinavTuru;

  final List<String> _sinavTurleri = ['Vize', 'Final', 'Kısa Sınav'];

  void _sinavEkle() {
    if (_dersKoduController.text.isNotEmpty &&
        _dersAdiController.text.isNotEmpty &&
        _sinavTarihiController.text.isNotEmpty &&
        _sinavTuru != null) {
      widget.hoca.sinavEkle(
        Sinav(
          _dersKoduController.text,
          _dersAdiController.text,
          _sinavTarihiController.text,
          _sinavTuru!,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sınav eklendi: $_sinavTuru')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sınav Ekle')),
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
              controller: _sinavTarihiController,
              decoration: const InputDecoration(labelText: 'Sınav Tarihi'),
            ),
            DropdownButtonFormField<String>(
              hint: const Text('Sınav Türü Seçin'),
              value: _sinavTuru,
              items: _sinavTurleri.map((tur) {
                return DropdownMenuItem(
                  value: tur,
                  child: Text(tur),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _sinavTuru = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sinavEkle,
              child: const Text('Sınav Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
