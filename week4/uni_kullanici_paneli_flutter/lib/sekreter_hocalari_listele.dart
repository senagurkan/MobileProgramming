import 'package:flutter/material.dart';
import 'models/sekreter.dart';

class SekreterHocalariListele extends StatelessWidget {
  final Sekreter sekreter;

  SekreterHocalariListele({required this.sekreter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hocaları Listele'),
      ),
      body: sekreter.hocaListesi.isEmpty
          ? const Center(
              child: Text(
                'Henüz eklenmiş hoca yok.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: sekreter.hocaListesi.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final hoca = sekreter.hocaListesi[index];
                return ListTile(
                  title: Text(
                    '${hoca.isim} ${hoca.soyisim}',
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
