import 'package:flutter/material.dart';
import 'ikinci_sayfa.dart';

class BirinciSayfa extends StatefulWidget {
  const BirinciSayfa({Key? key}) : super(key: key);

  @override
  _BirinciSayfaState createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _toplam = "";

  void _toplamiHesapla() {
    int sayi1 = int.tryParse(_controller1.text) ?? 0;
    int sayi2 = int.tryParse(_controller2.text) ?? 0;
    setState(() {
      _toplam = (sayi1 + sayi2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birinci Sayfa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Birinci Sayı'),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'İkinci Sayı'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toplamiHesapla,
              child: const Text('Toplam Sonucu Hesapla'),
            ),
            const SizedBox(height: 20),
            Text(
              'Sonuc: $_toplam',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IkinciSayfa()),
                );
              },
              child: const Text('2. Sayfaya Git'),
            ),
          ],
        ),
      ),
    );
  }
}
