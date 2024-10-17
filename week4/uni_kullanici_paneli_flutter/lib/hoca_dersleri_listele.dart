import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaDersleriListele extends StatelessWidget {
  final Hoca hoca;

  HocaDersleriListele({required this.hoca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dersleri Listele')),
      body: hoca.dersListesi.isEmpty
          ? const Center(
              child: Text(
                'Henüz eklenmiş ders yok.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: hoca.dersListesi.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              itemBuilder: (context, index) {
                final ders = hoca.dersListesi[index];
                return ListTile(
                  title: Text(
                    ders.dersAdi,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Ders Kodu: ${ders.dersKodu}\n'
                    'Haftalık Saat: ${ders.haftalikSaat}',
                  ),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
