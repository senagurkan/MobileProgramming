import 'package:flutter/material.dart';

class IkinciSayfa extends StatelessWidget {
  const IkinciSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İkinci Sayfa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      content: Text('Bu bir uyarıdır'),
                    );
                  },
                );
              },
              child: const Text('Uyarı Göster'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bu bir pop uptır')),
                );
              },
              child: const Text('Pop Up Göster'),
            ),
          ],
        ),
      ),
    );
  }
}
