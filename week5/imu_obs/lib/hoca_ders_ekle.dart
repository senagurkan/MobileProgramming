import 'package:flutter/material.dart';
import 'models/hoca.dart';

class HocaDersEkle extends StatefulWidget {
  final Hoca hoca;

  HocaDersEkle({required this.hoca});

  @override
  _HocaDersEkleState createState() => _HocaDersEkleState();
}

class _HocaDersEkleState extends State<HocaDersEkle> {
  final _dersKoduController = TextEditingController();
  final _dersAdiController = TextEditingController();
  final _haftalikSaatController = TextEditingController();

  void _dersEkle() {
    if (_dersKoduController.text.isNotEmpty &&
        _dersAdiController.text.isNotEmpty &&
        _haftalikSaatController.text.isNotEmpty) {
      widget.hoca.dersEkle(
        Ders(
          _dersKoduController.text,
          _dersAdiController.text,
          int.parse(_haftalikSaatController.text),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_dersAdiController.text} eklendi!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ders Ekle'),
        backgroundColor: const Color(0xFFE3F2FD), // Açık mavi ton
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
                  'Haftalık Saat',
                  _haftalikSaatController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _dersEkle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1976D2),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side:
                          const BorderSide(color: Color(0xFF1976D2), width: 2),
                    ),
                  ),
                  child: const Text(
                    'Ders Ekle',
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
