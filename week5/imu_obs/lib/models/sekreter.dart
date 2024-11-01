/*
Sena Gürkan
20120205021
Sekreter modeli oluşturuldu. Hoca ve öğrenci ekleme fonksiyonları eklendi. Hocaları ve öğrencileri listeleme fonksiyonları eklendi.
*/
import 'hoca.dart';
import 'ogrenci.dart';
import 'kisi.dart';

class Sekreter extends Kisi {
  List<Hoca> hocaListesi = [];
  List<Ogrenci> ogrenciListesi = [];

  Sekreter(String isim, String soyisim) : super(isim, soyisim);

  void hocaEkle(Hoca hoca) {
    hocaListesi.add(hoca);
    print("${hoca.isim} ${hoca.soyisim} isimli hoca eklendi.");
  }

  void ogrenciEkle(Ogrenci ogrenci) {
    ogrenciListesi.add(ogrenci);
    print("${ogrenci.isim} ${ogrenci.soyisim} isimli öğrenci eklendi.");
  }

  void hocalariListele() {
    print("\nHoca Listesi:");
    for (var hoca in hocaListesi) {
      print("- ${hoca.isim} ${hoca.soyisim}");
    }
  }

  void ogrencileriListele() {
    print("\nÖğrenci Listesi:");
    for (var ogrenci in ogrenciListesi) {
      print("- ${ogrenci.isim} ${ogrenci.soyisim}");
    }
  }
}
