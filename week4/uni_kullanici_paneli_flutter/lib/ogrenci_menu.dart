import 'package:flutter/material.dart';
import 'ogrenci_ders_ekle.dart';
import 'ogrenci_sinav_ekle.dart';
import 'ogrenci_not_ekle.dart';
import 'ogrenci_dersleri_listele.dart';
import 'ogrenci_sinavlari_listele.dart';
import 'models/ogrenci.dart';

class OgrenciMenu extends StatelessWidget {
  final Ogrenci ogrenci;

  OgrenciMenu({required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenci Menüsü'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgrenciDersEkle(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Çalışmak İçin Ders Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgrenciSinavEkle(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Sınav Olacak Tarih Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgrenciNotEkle(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Sınav Notu Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OgrenciDersleriListele(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Çalışılan Dersleri Listele'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OgrenciSinavlariListele(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Sınavları Listele'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Ana menüye geri dön
                },
                child: const Text('Çıkış'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
