import 'dart:io';
import 'hoca.dart';
import 'ogrenci.dart';
import 'sekreter.dart';

void main() {
  Sekreter sekreter = Sekreter();
  Hoca hoca = Hoca("Ali", "Veli");
  Ogrenci ogrenci = Ogrenci("Ahmet", "Yılmaz");

  while (true) {
    print("\n--- Uni Kullanıcı Paneli ---");
    print("1. Öğrenci olarak giriş yap");
    print("2. Sekreter olarak giriş yap");
    print("3. Hoca olarak giriş yap");
    print("4. Çıkış");
    stdout.write("Seçiminizi yapın: ");
    String? secim = stdin.readLineSync();

    if (secim == '1') {
      ogrenciMenu(ogrenci);
    } else if (secim == '2') {
      sekreterMenu(sekreter);
    } else if (secim == '3') {
      hocaMenu(hoca);
    } else if (secim == '4') {
      print("\nUygulamadan çıkılıyor...");
      break;
    } else {
      print("\nGeçersiz seçim! Lütfen tekrar deneyin.");
    }
  }
}

void sekreterMenu(Sekreter sekreter) {
  while (true) {
    print("\n--- Sekreter Menüsü ---");
    print("1. Öğrenci ekle");
    print("2. Hoca ekle");
    print("3. Öğrencileri listele");
    print("4. Hocaları listele");
    print("5. Çıkış");
    stdout.write("Seçiminizi yapın: ");
    String? secim = stdin.readLineSync();

    if (secim == '1') {
      stdout.write("Öğrencinin ismini girin: ");
      String? isim = stdin.readLineSync();
      stdout.write("Öğrencinin soyismini girin: ");
      String? soyisim = stdin.readLineSync();
      if (isim != null && soyisim != null) {
        sekreter.ogrenciEkle(Ogrenci(isim, soyisim));
      }
    } else if (secim == '2') {
      stdout.write("Hocanın ismini girin: ");
      String? isim = stdin.readLineSync();
      stdout.write("Hocanın soyismini girin: ");
      String? soyisim = stdin.readLineSync();
      if (isim != null && soyisim != null) {
        sekreter.hocaEkle(Hoca(isim, soyisim));
      }
    } else if (secim == '3') {
      sekreter.ogrencileriListele();
    } else if (secim == '4') {
      sekreter.hocalariListele();
    } else if (secim == '5') {
      print("\nSekreter menüsünden çıkılıyor...");
      break;
    } else {
      print("\nGeçersiz seçim! Lütfen tekrar deneyin.");
    }
  }
}

void hocaMenu(Hoca hoca) {
  while (true) {
    print("\n--- Hoca Menüsü ---");
    print("1. Ders ekle");
    print("2. Sınav ekle");
    print("3. Dersleri listele");
    print("4. Sınavları listele");
    print("5. Çıkış");
    stdout.write("Seçiminizi yapın: ");
    String? secim = stdin.readLineSync();

    if (secim == '1') {
      stdout.write("Ders kodunu girin: ");
      String? dersKodu = stdin.readLineSync();
      stdout.write("Ders adını girin: ");
      String? dersAdi = stdin.readLineSync();
      stdout.write("Haftalık ders saatini girin: ");
      int? saat = int.tryParse(stdin.readLineSync() ?? '');

      if (dersKodu != null && dersAdi != null && saat != null) {
        hoca.dersEkle(Ders(dersKodu, dersAdi, saat));
      }
    } else if (secim == '2') {
      stdout.write("Ders kodunu girin: ");
      String? dersKodu = stdin.readLineSync();
      stdout.write("Ders adını girin: ");
      String? dersAdi = stdin.readLineSync();
      stdout.write("Sınav tarihini girin (YYYY-MM-DD): ");
      String? tarih = stdin.readLineSync();

      String? tur;
      while (tur == null) {
        print("\nSınav Türünü Seçin:");
        print("Vize : 1");
        print("Final : 2");
        print("Kısa Sınav : 3");
        stdout.write("Seçiminizi yapın: ");
        String? turSecim = stdin.readLineSync();

        if (turSecim == '1') {
          tur = "Vize";
        } else if (turSecim == '2') {
          tur = "Final";
        } else if (turSecim == '3') {
          tur = "Kısa Sınav";
        } else {
          print("\nHatalı giriş! Lütfen 1, 2 veya 3 seçin.");
        }
      }

      if (dersKodu != null && dersAdi != null && tarih != null) {
        hoca.sinavEkle(Sinav(dersKodu, dersAdi, tarih, tur));
      }
    } else if (secim == '3') {
      hoca.dersleriListele();
    } else if (secim == '4') {
      hoca.sinavlariListele();
    } else if (secim == '5') {
      print("\nHoca menüsünden çıkılıyor...");
      break;
    } else {
      print("\nGeçersiz seçim! Lütfen tekrar deneyin.");
    }
  }
}

void ogrenciMenu(Ogrenci ogrenci) {
  while (true) {
    print("\n--- Öğrenci Menüsü ---");
    print("1. Çalışmak için ders ekle");
    print("2. Sınav olacak tarih ekle");
    print("3. Sınav notu ekle");
    print("4. Çalışılan dersleri listele");
    print("5. Sınavları listele");
    print("6. Çıkış");
    stdout.write("Seçiminizi yapın: ");
    String? secim = stdin.readLineSync();

    if (secim == '1') {
      stdout.write("Ders kodunu girin: ");
      String? dersKodu = stdin.readLineSync();
      stdout.write("Ders adını girin: ");
      String? dersAdi = stdin.readLineSync();
      stdout.write("Çalışma süresini (saat) girin: ");
      int? sure = int.tryParse(stdin.readLineSync() ?? '');

      if (dersKodu != null && dersAdi != null && sure != null) {
        ogrenci.dersEkle(CalisilanDers(dersKodu, dersAdi, sure));
      }
    } else if (secim == '2') {
      stdout.write("Ders kodunu girin: ");
      String? dersKodu = stdin.readLineSync();
      stdout.write("Ders adını girin: ");
      String? dersAdi = stdin.readLineSync();
      stdout.write("Sınav tarihini girin (YYYY-MM-DD): ");
      String? tarih = stdin.readLineSync();

      if (dersKodu != null && dersAdi != null && tarih != null) {
        ogrenci.sinavEkle(OgrenciSinav(dersKodu, dersAdi, tarih));
      }
    } else if (secim == '3') {
      if (ogrenci.sinavlar.isEmpty) {
        print("\nHenüz eklenmiş bir sınav bulunmuyor.");
        continue;
      }

      print("\nSınavlardan birini seçin:");
      for (int i = 0; i < ogrenci.sinavlar.length; i++) {
        print(
            "${i + 1}. ${ogrenci.sinavlar[i].dersAdi} - ${ogrenci.sinavlar[i].sinavTarihi}");
      }

      int? sinavSecimi;
      while (sinavSecimi == null ||
          sinavSecimi < 1 ||
          sinavSecimi > ogrenci.sinavlar.length) {
        stdout.write("Seçiminizi yapın: ");
        sinavSecimi = int.tryParse(stdin.readLineSync() ?? '');

        if (sinavSecimi == null ||
            sinavSecimi < 1 ||
            sinavSecimi > ogrenci.sinavlar.length) {
          print("\nGeçersiz seçim! Lütfen geçerli bir sınav numarası seçin.");
        }
      }

      stdout.write("Notu girin: ");
      double? not = double.tryParse(stdin.readLineSync() ?? '');

      if (not != null) {
        ogrenci.sinavlar[sinavSecimi - 1].not = not;
        print(
            "${ogrenci.sinavlar[sinavSecimi - 1].dersAdi} sınavına not eklendi: $not");
      }
    } else if (secim == '4') {
      ogrenci.calisilanDersleriListele();
    } else if (secim == '5') {
      ogrenci.sinavlariListele();
    } else if (secim == '6') {
      print("\nÖğrenci menüsünden çıkılıyor...");
      break;
    } else {
      print("\nGeçersiz seçim! Lütfen tekrar deneyin.");
    }
  }
}
