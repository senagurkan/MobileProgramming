import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciSinavlariListele extends StatelessWidget {
  final Ogrenci ogrenci;

  OgrenciSinavlariListele({required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınavları Listele'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ogrenci.sinavlar.isEmpty
            ? const Center(
                child: Text('Henüz eklenmiş sınav yok.'),
              )
            : ListView.builder(
                itemCount: ogrenci.sinavlar.length,
                itemBuilder: (context, index) {
                  final sinav = ogrenci.sinavlar[index];
                  return ListTile(
                    title: Text(sinav['dersAdi']),
                    subtitle: Text(
                        'Ders Kodu: ${sinav['dersKodu']} - Tarih: ${sinav['sinavTarihi']} - Not: ${sinav['not'] ?? 'Henüz girilmedi'}'),
                  );
                },
              ),
      ),
    );
  }
}
