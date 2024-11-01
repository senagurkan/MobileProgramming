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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ogrenci.dersler.isEmpty
              ? const Center(
                  child: Text(
                    'Henüz eklenmiş ders yok.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: ogrenci.dersler.length,
                  itemBuilder: (context, index) {
                    final ders = ogrenci.dersler[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        title: Text(
                          ders['dersAdi'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'Ders Kodu: ${ders['dersKodu']} - Süre: ${ders['calismaSuresi']} saat',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
