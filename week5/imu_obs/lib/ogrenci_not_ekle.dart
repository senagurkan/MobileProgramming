import 'package:flutter/material.dart';
import 'models/ogrenci.dart';

class OgrenciNotEkle extends StatefulWidget {
  final Ogrenci ogrenci;

  OgrenciNotEkle({required this.ogrenci});

  @override
  _OgrenciNotEkleState createState() => _OgrenciNotEkleState();
}

class _OgrenciNotEkleState extends State<OgrenciNotEkle> {
  int? _selectedSinavIndex;
  final _notController = TextEditingController();

  @override
  void dispose() {
    _notController.dispose();
    super.dispose();
  }

  void _notEkle() {
    if (_selectedSinavIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir sınav seçin!')),
      );
      return;
    }

    final not = double.tryParse(_notController.text);
    if (not == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir not girin!')),
      );
      return;
    }

    setState(() {
      widget.ogrenci.sinavlar[_selectedSinavIndex!]['not'] = not;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Not başarıyla eklendi!')),
    );

    Navigator.pop(context); // Return to student menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınav Notu Ekle'),
        backgroundColor:
            const Color.fromARGB(255, 220, 235, 245), // Light blue tone
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color.fromARGB(255, 230, 240, 250)
            ], // White to light blue gradient
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bir sınav seçin:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: widget.ogrenci.sinavlar.isEmpty
                    ? const Center(
                        child: Text(
                          'Henüz eklenmiş sınav yok.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.ogrenci.sinavlar.length,
                        itemBuilder: (context, index) {
                          final sinav = widget.ogrenci.sinavlar[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                "${sinav['dersAdi']} - ${sinav['sinavTarihi']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Radio<int>(
                                value: index,
                                groupValue: _selectedSinavIndex,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedSinavIndex = value;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _notController,
                decoration: const InputDecoration(
                  labelText: 'Not',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _notEkle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 39, 137, 157),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Not Ekle',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
