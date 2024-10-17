import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaSinavlariListele extends StatelessWidget {
  final Hoca hoca;

  HocaSinavlariListele({required this.hoca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sınavları Listele')),
      body: hoca.sinavListesi.isEmpty
          ? const Center(
              child: Text(
                'Henüz eklenmiş sınav yok.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: hoca.sinavListesi.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              itemBuilder: (context, index) {
                final sinav = hoca.sinavListesi[index];
                return ListTile(
                  title: Text(
                    sinav.dersAdi,
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Ders Kodu: ${sinav.dersKodu}\n'
                    'Tarih: ${sinav.sinavTarihi}\n'
                    'Tür: ${sinav.sinavTuru}',
                  ),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
