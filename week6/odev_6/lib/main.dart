import 'package:flutter/material.dart';
import 'screens/birinci_sayfa.dart';

void main() {
  runApp(Odev6());
}

class Odev6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odev 6',
      home: BirinciSayfa(),
    );
  }
}
