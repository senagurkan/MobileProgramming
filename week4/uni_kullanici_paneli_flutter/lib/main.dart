import 'package:flutter/material.dart';
import 'ogrenci_menu.dart';
import 'hoca_menu.dart';
import 'sekreter_menu.dart';
import 'models/ogrenci.dart';
import 'models/sekreter.dart';
import 'models/hoca.dart'; // Hoca modelini ekliyoruz

void main() {
  runApp(UniKullaniciPaneliApp());
}

class UniKullaniciPaneliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uni Kullanıcı Paneli',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaMenu(),
    );
  }
}

class AnaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Ogrenci ogrenci = Ogrenci("Ahmet", "Yılmaz"); // Öğrenci nesnesi
    final Sekreter sekreter = Sekreter(); // Sekreter nesnesi
    final Hoca hoca = Hoca("Ali", "Veli"); // Hoca nesnesi

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uni Kullanıcı Paneli'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OgrenciMenu(ogrenci: ogrenci),
                    ),
                  );
                },
                child: const Text('Öğrenci Olarak Giriş Yap'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HocaMenu(hoca: hoca), // Hoca menüsüne geçiş
                    ),
                  );
                },
                child: const Text('Hoca Olarak Giriş Yap'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SekreterMenu(sekreter: sekreter),
                    ),
                  );
                },
                child: const Text('Sekreter Olarak Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}