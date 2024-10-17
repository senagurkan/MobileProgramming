import 'package:flutter/material.dart';
import 'models/sekreter.dart';
import 'sekreter_ogrenci_ekle.dart';
import 'sekreter_hoca_ekle.dart';
import 'sekreter_ogrencileri_listele.dart';
import 'sekreter_hocalari_listele.dart';

class SekreterMenu extends StatelessWidget {
  final Sekreter sekreter;

  SekreterMenu({required this.sekreter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sekreter Menüsü')),
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
                      builder: (context) =>
                          SekreterOgrenciEkle(sekreter: sekreter),
                    ),
                  );
                },
                child: const Text('Öğrenci Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SekreterHocaEkle(sekreter: sekreter),
                    ),
                  );
                },
                child: const Text('Hoca Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SekreterOgrencileriListele(sekreter: sekreter),
                    ),
                  );
                },
                child: const Text('Öğrencileri Listele'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SekreterHocalariListele(sekreter: sekreter),
                    ),
                  );
                },
                child: const Text('Hocaları Listele'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
