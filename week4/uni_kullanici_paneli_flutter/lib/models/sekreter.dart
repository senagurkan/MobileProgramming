import 'hoca.dart';
import 'ogrenci.dart';

class Sekreter {
  List<Hoca> hocaListesi = [];
  List<Ogrenci> ogrenciListesi = [];

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
