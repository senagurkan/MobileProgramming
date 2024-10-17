import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciNotEkle extends StatefulWidget {
  final Ogrenci ogrenci;

  OgrenciNotEkle({required this.ogrenci});

  @override
  _OgrenciNotEkleState createState() => _OgrenciNotEkleState();
}

class _OgrenciNotEkleState extends State<OgrenciNotEkle> {
  int? _selectedSinavIndex;
  final _notController = TextEditingController();

  @override
  void dispose() {
    _notController.dispose();
    super.dispose();
  }

  void _notEkle() {
    if (_selectedSinavIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir sınav seçin!')),
      );
      return;
    }

    final not = double.tryParse(_notController.text);
    if (not == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir not girin!')),
      );
      return;
    }

    setState(() {
      widget.ogrenci.sinavlar[_selectedSinavIndex!]['not'] = not;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Not başarıyla eklendi!')),
    );

    Navigator.pop(context); // Öğrenci menüsüne geri dön
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sınav Notu Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Bir sınav seçin:'),
            Expanded(
              child: ListView.builder(
                itemCount: widget.ogrenci.sinavlar.length,
                itemBuilder: (context, index) {
                  final sinav = widget.ogrenci.sinavlar[index];
                  return ListTile(
                    title:
                        Text("${sinav['dersAdi']} - ${sinav['sinavTarihi']}"),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedSinavIndex,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedSinavIndex = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _notController,
              decoration: const InputDecoration(labelText: 'Not'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _notEkle,
              child: const Text('Not Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
