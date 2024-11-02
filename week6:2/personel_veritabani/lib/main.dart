import 'package:flutter/material.dart';
import 'db/personel_database.dart';
import 'models/personel.dart';

void main() {
  runApp(const PersonelVeritabaniApp());
}

class PersonelVeritabaniApp extends StatelessWidget {
  const PersonelVeritabaniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personel Veritabanı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PersonelListesi(),
    );
  }
}

class PersonelListesi extends StatefulWidget {
  const PersonelListesi({Key? key}) : super(key: key);

  @override
  _PersonelListesiState createState() => _PersonelListesiState();
}

class _PersonelListesiState extends State<PersonelListesi> {
  List<Personel> _personeller = [];

  @override
  void initState() {
    super.initState();
    _refreshPersonelList();
  }

  Future<void> _refreshPersonelList() async {
    final personeller = await PersonelDatabase.instance.getAllPersonel();
    setState(() {
      _personeller = personeller;
    });
  }

  Future<void> _personelEkle(
      String ad, String soyad, String departman, int maas) async {
    final yeniPersonel =
        Personel(ad: ad, soyad: soyad, departman: departman, maas: maas);
    await PersonelDatabase.instance.addPersonel(yeniPersonel);
    _refreshPersonelList();
  }

  void _showAddPersonelDialog() {
    String ad = '';
    String soyad = '';
    String departman = '';
    int maas = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Yeni Personel Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Ad'),
                onChanged: (value) {
                  ad = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Soyad'),
                onChanged: (value) {
                  soyad = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Departman'),
                onChanged: (value) {
                  departman = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Maaş'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  maas = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (ad.isNotEmpty &&
                    soyad.isNotEmpty &&
                    departman.isNotEmpty &&
                    maas > 0) {
                  _personelEkle(ad, soyad, departman, maas);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Listesi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddPersonelDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _personeller.length,
        itemBuilder: (context, index) {
          final personel = _personeller[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: ListTile(
              title: Text(
                '${personel.ad} ${personel.soyad}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${personel.departman} - Maaş: ${personel.maas}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await PersonelDatabase.instance.deletePersonel(personel.id!);
                  _refreshPersonelList();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
