/*
Sena Gürkan
20120205021
Öğrenci modelinde ders ve sınav ekleme fonksiyonları oluşturuldu. Ders ve sınav listelerini döndüren fonksiyonlar eklendi.
*/

import 'kisi.dart';

class Ogrenci extends Kisi {
  List<Map<String, dynamic>> dersler = [];
  List<Map<String, dynamic>> sinavlar = [];

  Ogrenci(String isim, String soyisim) : super(isim, soyisim);

  void dersleriListele() {
    print("\nÇalışılan Dersler:");
    for (var ders in dersler) {
      print(
          "${ders['dersKodu']} - ${ders['dersAdi']} : ${ders['calismaSuresi']} saat");
    }
  }

  void sinavlariListele() {
    print("\nSınavlar:");
    for (var sinav in sinavlar) {
      print(
          "${sinav['dersKodu']} - ${sinav['dersAdi']} : ${sinav['sinavTarihi']}");
    }
  }
}
