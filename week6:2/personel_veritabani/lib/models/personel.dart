class Personel {
  final int? id;
  final String ad;
  final String soyad;
  final String departman;
  final int maas;

  Personel(
      {this.id,
      required this.ad,
      required this.soyad,
      required this.departman,
      required this.maas});

  // Veriyi Map formatına çevirme
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ad': ad,
      'soyad': soyad,
      'departman': departman,
      'maas': maas,
    };
  }

  // Veriyi Map formatından Personel nesnesine çevirme
  static Personel fromMap(Map<String, dynamic> map) {
    return Personel(
      id: map['id'],
      ad: map['ad'],
      soyad: map['soyad'],
      departman: map['departman'],
      maas: map['maas'],
    );
  }
}
