import 'package:flutter/material.dart';
import 'models/hoca.dart';
import 'hoca_ders_ekle.dart';
import 'hoca_sinav_ekle.dart';
import 'hoca_dersleri_listele.dart';
import 'hoca_sinavlari_listele.dart';

class HocaMenu extends StatelessWidget {
  final Hoca hoca;

  HocaMenu({required this.hoca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hoca Menüsü')),
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
                      builder: (context) => HocaDersEkle(hoca: hoca),
                    ),
                  );
                },
                child: const Text('Ders Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaSinavEkle(hoca: hoca),
                    ),
                  );
                },
                child: const Text('Sınav Ekle'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaDersleriListele(hoca: hoca),
                    ),
                  );
                },
                child: const Text('Dersleri Listele'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaSinavlariListele(hoca: hoca),
                    ),
                  );
                },
                child: const Text('Sınavları Listele'),
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
