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
        backgroundColor: const Color(0xFFF5F5F5),
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
        child: sekreter.hocaListesi.isEmpty
            ? const Center(
                child: Text(
                  'Henüz eklenmiş hoca yok.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: sekreter.hocaListesi.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final hoca = sekreter.hocaListesi[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        '${hoca.isim} ${hoca.soyisim}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF512DA8),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
