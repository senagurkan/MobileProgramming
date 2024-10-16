import 'kisi.dart';

// Çalışılan ders sınıfı
class CalisilanDers {
  String dersKodu;
  String dersAdi;
  int calismaSuresi;

  CalisilanDers(this.dersKodu, this.dersAdi, this.calismaSuresi);

  @override
  String toString() {
    return "Ders Kodu: $dersKodu, Ders Adı: $dersAdi, Çalışma Süresi: $calismaSuresi saat";
  }
}

// Sınav sınıfı
class OgrenciSinav {
  String dersKodu;
  String dersAdi;
  String sinavTarihi;
  double? not; // Not opsiyonel, eklenebilir

  OgrenciSinav(this.dersKodu, this.dersAdi, this.sinavTarihi, [this.not]);

  @override
  String toString() {
    String notBilgisi = not != null ? ", Not: $not" : ", Not: Henüz girilmedi";
    return "Ders Kodu: $dersKodu, Ders Adı: $dersAdi, Tarih: $sinavTarihi$notBilgisi";
  }
}

// Öğrenci sınıfı, Kisi sınıfından kalıtım alır
class Ogrenci extends Kisi {
  List<CalisilanDers> dersler = [];
  List<OgrenciSinav> sinavlar = [];

  Ogrenci(String isim, String soyisim) : super(isim, soyisim);

  void dersEkle(CalisilanDers ders) {
    dersler.add(ders);
    print("${ders.dersAdi} çalışmak için eklendi.");
  }

  void sinavEkle(OgrenciSinav sinav) {
    sinavlar.add(sinav);
    print("${sinav.dersAdi} için sınav tarihi eklendi.");
  }

  void notEkle(String dersKodu, double not) {
    var sinav = sinavlar.firstWhere(
      (s) => s.dersKodu == dersKodu,
      orElse: () => throw "Bu ders için sınav bulunamadı.",
    );
    sinav.not = not;
    print("${sinav.dersAdi} için not eklendi: $not");
  }

  void calisilanDersleriListele() {
    print("\nÇalışılan Dersler:");
    for (var ders in dersler) {
      print("- ${ders.toString()}");
    }
  }

  void sinavlariListele() {
    print("\nSınavlar:");
    for (var sinav in sinavlar) {
      print("- ${sinav.toString()}");
    }
  }
}
