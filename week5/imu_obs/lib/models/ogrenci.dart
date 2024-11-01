import 'kisi.dart';

class Ogrenci extends Kisi {
  List<Map<String, dynamic>> dersler = [];
  List<Map<String, dynamic>> sinavlar = [];

  Ogrenci(String isim, String soyisim) : super(isim, soyisim);

  // Ders ekleme fonksiyonu
  void dersEkle(String dersKodu, String dersAdi, int calismaSuresi) {
    dersler.add({
      'dersKodu': dersKodu,
      'dersAdi': dersAdi,
      'calismaSuresi': calismaSuresi,
    });
  }

  // Sınav ekleme fonksiyonu
  void sinavEkle(String dersKodu, String dersAdi, DateTime sinavTarihi) {
    sinavlar.add({
      'dersKodu': dersKodu,
      'dersAdi': dersAdi,
      'sinavTarihi': sinavTarihi,
    });
  }

  // Çalışılan dersleri listeleme fonksiyonu
  void dersleriListele() {
    print("\nÇalışılan Dersler:");
    for (var ders in dersler) {
      print(
          "${ders['dersKodu']} - ${ders['dersAdi']} : ${ders['calismaSuresi']} saat");
    }
  }

  // Sınavları listeleme fonksiyonu
  void sinavlariListele() {
    print("\nSınavlar:");
    for (var sinav in sinavlar) {
      print(
          "${sinav['dersKodu']} - ${sinav['dersAdi']} : ${sinav['sinavTarihi']}");
    }
  }
}
