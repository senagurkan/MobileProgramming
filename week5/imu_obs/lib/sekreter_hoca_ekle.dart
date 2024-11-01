import 'package:flutter/material.dart';
import 'models/hoca.dart';
import 'models/sekreter.dart';

class SekreterHocaEkle extends StatefulWidget {
  final Sekreter sekreter;

  SekreterHocaEkle({required this.sekreter});

  @override
  _SekreterHocaEkleState createState() => _SekreterHocaEkleState();
}

class _SekreterHocaEkleState extends State<SekreterHocaEkle> {
  final _isimController = TextEditingController();
  final _soyisimController = TextEditingController();

  @override
  void dispose() {
    _isimController.dispose();
    _soyisimController.dispose();
    super.dispose();
  }

  void _hocaEkle() {
    if (_isimController.text.isNotEmpty && _soyisimController.text.isNotEmpty) {
      final hoca = Hoca(
        _isimController.text,
        _soyisimController.text,
      );

      widget.sekreter.hocaEkle(hoca);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${hoca.isim} ${hoca.soyisim} eklendi!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoca Ekle'),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF3E5F5), // Açık beyazdan açık mora geçiş
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField("Hoca İsmi", _isimController),
              _buildInputField("Hoca Soyismi", _soyisimController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hocaEkle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF512DA8),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xFF512DA8), width: 2),
                  ),
                ),
                child: const Text(
                  'Hoca Ekle',
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
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF512DA8)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF512DA8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF512DA8), width: 2),
          ),
        ),
      ),
    );
  }
}
