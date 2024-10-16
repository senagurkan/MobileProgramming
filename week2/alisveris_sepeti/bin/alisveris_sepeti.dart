/*
 * Sena Gürkan
 * 11.10.2024
 * 20120205021
 * Hafta 2 - Mobil Progamlama Alisveris Sepeti Uygulamasi
 */

import 'dart:io';
import 'dart:math';

// Urun sınıfını burada olusturdum. Ödevde belirtdilfiği üzere  bu sınıfta urunun adını ve fiyatını tutuyoruz.
class Urun {
  String ad;
  double fiyat;

  Urun(this.ad, this.fiyat);
}

// Bu kısımda alışveriş sepeti sınıfını oluşturdum listeye ürün eklemek, toplam tutarı hesaplamak ve sepeti gostermek için fonksiyonlar oluşturdum.
class AlisverisSepeti {
  List<Urun> urunler = [];
  double toplamTutar = 0.0;

// Listeye urun ekleyen fonksiyon
  void urunEkle(Urun urun) {
    urunler.add(urun);
    toplamTutarHesapla();
  }

// Toplam tutari hesaplayan fonksiyon
  void toplamTutarHesapla() {
    toplamTutar = urunler.fold(0, (sum, item) => sum + item.fiyat);
  }

// Alisveris tamamlanınca sepeti gösteren fonksiyon
  void sepetiGoster() {
    print('Alışveriş Sepeti:');
    urunler.forEach((urun) => print('${urun.ad} - ${urun.fiyat} TL'));
    print('Toplam Tutar: $toplamTutar TL');
  }
}

void main() {
  int yas;
  // musteri numarasının nasıl belirleneceği hakkında odevde bir sey gormedigim için random bir sayı oluşturuyorum.
  int musteriNumarasi = Random().nextInt(100) +
      1; // 1 ile 100 arasında rastgele bir müşteri numarası oluşturduk.
  double toplamTutar = 0.0;

  // Müsteriden indirim oranını belirlemek için yaşını girmesini istiyoruz.
  print('Yaşınızı girin: ');
  yas = int.parse(stdin.readLineSync()!);

  // Musterinin yasina gore indirim oranini belirliyoruz. 18 yasindan kucuk olanlara %10, 18-60 arasindakilere %5, 60 yasindan buyuklere %15 indirim uygulanacak ve bunu if-else karar yapıları kullanarak belirliyoruz.
  double indirim = 0.0;
  if (yas < 18) {
    indirim = 0.10;
  } else if (yas <= 60) {
    indirim = 0.05;
  } else {
    indirim = 0.15;
  }

  AlisverisSepeti sepet = AlisverisSepeti();

  // Ürünleri while dongusunde almamizi istediginiz icin bu yapiyi olusturdum. Musteri q ya basana kadar urun ekleyebilecek.
  while (true) {
    print('Ürün adı girin (Çıkmak için "q" yazın): ');
    String urunAdi = stdin.readLineSync()!;
    if (urunAdi.toLowerCase() == 'q') {
      break;
    }

    print('Ürün fiyatı girin: ');
    double urunFiyati = double.parse(stdin.readLineSync()!);

    Urun urun = Urun(urunAdi, urunFiyati);
    sepet.urunEkle(urun);
  }

  // q ya basildiginda alisverisi tamamladigimizi belirtip sepeti gosteriyor daha sonra indirimli ve indirimsiz tutarlari gosteriyoruz.
  print('\nAlışveriş tamamlandı.');
  print('------------------------');
  print(
      'Müşteri Numarası: $musteriNumarasi'); // Otomatik olarak atanan müşteri numarasını gösterdim
  sepet.sepetiGoster();
  toplamTutar = sepet.toplamTutar * (1 - indirim);
  print('İndirimli Toplam Tutar: $toplamTutar TL');
}
