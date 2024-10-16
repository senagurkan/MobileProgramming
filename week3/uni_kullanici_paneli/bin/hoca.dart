import 'kisi.dart';

class Ders {
  String dersKodu;
  String dersAdi;
  int haftalikSaat;

  Ders(this.dersKodu, this.dersAdi, this.haftalikSaat);

  @override
  String toString() {
    return "Ders Kodu: $dersKodu, Ders Adı: $dersAdi, Haftalık Saat: $haftalikSaat";
  }
}

class Sinav {
  String dersKodu;
  String dersAdi;
  String sinavTarihi;
  String sinavTuru;

  Sinav(this.dersKodu, this.dersAdi, this.sinavTarihi, this.sinavTuru);

  @override
  String toString() {
    return "Ders Kodu: $dersKodu, Ders Adı: $dersAdi, Tarih: $sinavTarihi, Tür: $sinavTuru";
  }
}

class Hoca extends Kisi {
  List<Ders> dersListesi = [];
  List<Sinav> sinavListesi = [];

  Hoca(String isim, String soyisim) : super(isim, soyisim);

  void dersEkle(Ders ders) {
    dersListesi.add(ders);
    print("${ders.dersAdi} adlı ders eklendi.");
  }

  void sinavEkle(Sinav sinav) {
    sinavListesi.add(sinav);
    print("${sinav.sinavTuru} türünde sınav eklendi.");
  }

  void dersleriListele() {
    print("\nDers Listesi:");
    for (var ders in dersListesi) {
      print("- ${ders.toString()}");
    }
  }

  void sinavlariListele() {
    print("\nSınav Listesi:");
    for (var sinav in sinavListesi) {
      print("- ${sinav.toString()}");
    }
  }
}
