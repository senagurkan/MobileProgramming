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
      appBar: AppBar(
        title: const Text('Hoca Menüsü'),
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
              Color.fromARGB(255, 230, 240, 250),
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
                  'Ders Ekle',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaDersEkle(hoca: hoca),
                    ),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Sınav Ekle',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaSinavEkle(hoca: hoca),
                    ),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Dersleri Listele',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaDersleriListele(hoca: hoca),
                    ),
                  ),
                ),
                _buildMenuButton(
                  context,
                  'Sınavları Listele',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HocaSinavlariListele(hoca: hoca),
                    ),
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
