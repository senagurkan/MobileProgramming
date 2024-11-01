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
      appBar: AppBar(
        title: const Text('Sekreter Menüsü'),
        backgroundColor: const Color(0xFFF5F5F5), // Açık bir renk
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF3E5F5), // Açık beyazdan açık mora geçiş
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMenuButton(
                  context,
                  label: 'Öğrenci Ekle',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SekreterOgrenciEkle(sekreter: sekreter),
                      ),
                    );
                  },
                ),
                _buildMenuButton(
                  context,
                  label: 'Hoca Ekle',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SekreterHocaEkle(sekreter: sekreter),
                      ),
                    );
                  },
                ),
                _buildMenuButton(
                  context,
                  label: 'Öğrencileri Listele',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SekreterOgrencileriListele(sekreter: sekreter),
                      ),
                    );
                  },
                ),
                _buildMenuButton(
                  context,
                  label: 'Hocaları Listele',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SekreterHocalariListele(sekreter: sekreter),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF512DA8),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side:
                          const BorderSide(color: Color(0xFF512DA8), width: 2),
                    ),
                  ),
                  child: const Text(
                    'Çıkış',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF512DA8),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 3,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
