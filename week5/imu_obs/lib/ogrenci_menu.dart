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
        backgroundColor:
            const Color.fromARGB(255, 220, 235, 245), // Light blue tone
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color.fromARGB(255, 230, 240, 250)
            ], // White to light blue gradient
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMenuButton(
                  context,
                  'Çalışmak İçin Ders Ekle',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OgrenciDersEkle(ogrenci: ogrenci)),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Sınav Olacak Tarih Ekle',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OgrenciSinavEkle(ogrenci: ogrenci)),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Sınav Notu Ekle',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OgrenciNotEkle(ogrenci: ogrenci)),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Çalışılan Dersleri Listele',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OgrenciDersleriListele(ogrenci: ogrenci)),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Sınavları Listele',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OgrenciSinavlariListele(ogrenci: ogrenci)),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 39, 137, 157),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Çıkış'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 39, 137, 157),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(label),
      ),
    );
  }
}
