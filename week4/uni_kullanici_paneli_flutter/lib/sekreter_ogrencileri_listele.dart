import 'package:flutter/material.dart';
import 'models/sekreter.dart';

class SekreterOgrencileriListele extends StatelessWidget {
  final Sekreter sekreter;

  SekreterOgrencileriListele({required this.sekreter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrencileri Listele'),
      ),
      body: sekreter.ogrenciListesi.isEmpty
          ? const Center(
              child: Text(
                'Henüz eklenmiş öğrenci yok.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: sekreter.ogrenciListesi.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final ogrenci = sekreter.ogrenciListesi[index];
                return ListTile(
                  title: Text(
                    '${ogrenci.isim} ${ogrenci.soyisim}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                );
              },
            ),
    );
  }
}
