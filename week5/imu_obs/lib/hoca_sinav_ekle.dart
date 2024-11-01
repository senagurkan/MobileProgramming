import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaSinavEkle extends StatefulWidget {
  final Hoca hoca;

  HocaSinavEkle({required this.hoca});

  @override
  _HocaSinavEkleState createState() => _HocaSinavEkleState();
}

class _HocaSinavEkleState extends State<HocaSinavEkle> {
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _sinavTarihiController = TextEditingController();
  String? _sinavTuru;

  final List<String> _sinavTurleri = ['Vize', 'Final', 'Kısa Sınav'];

  void _sinavEkle() {
    if (_dersKoduController.text.isNotEmpty &&
        _dersAdiController.text.isNotEmpty &&
        _sinavTarihiController.text.isNotEmpty &&
        _sinavTuru != null) {
      widget.hoca.sinavEkle(
        Sinav(
          _dersKoduController.text,
          _dersAdiController.text,
          _sinavTarihiController.text,
          _sinavTuru!,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sınav eklendi: $_sinavTuru')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sınav Ekle'),
        backgroundColor: const Color(0xFFE3F2FD),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFE1F5FE), // Beyazdan açık maviye geçiş
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputField('Ders Kodu', _dersKoduController),
                const SizedBox(height: 10),
                _buildInputField('Ders Adı', _dersAdiController),
                const SizedBox(height: 10),
                _buildInputField(
                  'Sınav Tarihi',
                  _sinavTarihiController,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  hint: const Text('Sınav Türü Seçin'),
                  value: _sinavTuru,
                  items: _sinavTurleri.map((tur) {
                    return DropdownMenuItem(
                      value: tur,
                      child: Text(tur),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _sinavTuru = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xFF1976D2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xFF1976D2),
                        width: 1.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _sinavEkle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1976D2),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                        color: Color(0xFF1976D2),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sınav Ekle',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF1976D2)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFF1976D2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
