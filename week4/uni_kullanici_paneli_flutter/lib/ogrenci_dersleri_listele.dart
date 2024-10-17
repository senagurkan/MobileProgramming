import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciDersleriListele extends StatelessWidget {
  final Ogrenci ogrenci;

  OgrenciDersleriListele({required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışılan Dersleri Listele'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ogrenci.dersler.isEmpty
            ? const Center(
                child: Text('Henüz eklenmiş ders yok.'),
              )
            : ListView.builder(
                itemCount: ogrenci.dersler.length,
                itemBuilder: (context, index) {
                  final ders = ogrenci.dersler[index];
                  return ListTile(
                    title: Text(ders['dersAdi']),
                    subtitle: Text(
                        'Ders Kodu: ${ders['dersKodu']} - Süre: ${ders['calismaSuresi']} saat'),
                  );
                },
              ),
      ),
    );
  }
}
