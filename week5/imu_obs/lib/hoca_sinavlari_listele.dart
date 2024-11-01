import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaSinavlariListele extends StatelessWidget {
  final Hoca hoca;

  HocaSinavlariListele({required this.hoca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınavları Listele'),
        backgroundColor: const Color(0xFFE3F2FD),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFE1F5FE), // Beyazdan açık maviye geçiş
            ],
          ),
        ),
        child: hoca.sinavListesi.isEmpty
            ? const Center(
                child: Text(
                  'Henüz eklenmiş sınav yok.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: hoca.sinavListesi.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final sinav = hoca.sinavListesi[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      title: Text(
                        sinav.dersAdi,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      subtitle: Text(
                        'Ders Kodu: ${sinav.dersKodu}\n'
                        'Tarih: ${sinav.sinavTarihi}\n'
                        'Tür: ${sinav.sinavTuru}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
