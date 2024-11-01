import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_page.dart';
import 'teacher_page.dart';
import 'secretary_page.dart';
import 'ogrenci_menu.dart'; // OgrenciMenu import edildi
import 'models/ogrenci.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

Map<String, dynamic> registeredUser =
    {}; // Geçici kullanıcı bilgileri saklama yapısı

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFF1F1F1),
              Color.fromARGB(255, 52, 184, 210),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 200),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Image.asset(
                          'assets/images/imu_logo.png',
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Öğrenci Girişi",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(146, 0, 0, 0),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildInputField("E-Posta", emailController, false),
                      _buildInputField("Parola", passwordController, true),
                      const SizedBox(height: 40),
                      _buildLoginButton(context),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: GoogleFonts.poppins(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14, // Daha küçük font boyutu
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: Text(
                          "Öğretmen veya Sekreter Olarak Devam Edin",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildRoleButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: InkWell(
        onTap: () {
          if (emailController.text == registeredUser['email'] &&
              passwordController.text == registeredUser['password']) {
            // Giriş başarılı, OgrenciMenu'ye yönlendir
            Ogrenci ogrenci = Ogrenci(
              registeredUser['name'] ?? "İsim",
              registeredUser['lastName'] ?? "Soyisim",
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OgrenciMenu(ogrenci: ogrenci),
              ),
            );
          } else {
            // Hatalı giriş
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Giriş Başarısız"),
                content: const Text("E-posta veya parola hatalı."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Tamam"),
                  ),
                ],
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 113, 204, 207),
                Color.fromARGB(255, 39, 137, 157),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              "Giriş Yap",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String hint, TextEditingController controller, bool isPassword) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButtons(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FadeInUp(
            duration: const Duration(milliseconds: 1800),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherPage()),
                );
              },
              height: 50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                    color: Color.fromARGB(255, 26, 139, 167), width: 2),
              ),
              child: const Center(
                child: Text(
                  "Öğretmen Girişi",
                  style: TextStyle(
                    color: Color.fromARGB(255, 26, 139, 167),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: FadeInUp(
            duration: const Duration(milliseconds: 1900),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecretaryPage()),
                );
              },
              height: 50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                    color: Color.fromARGB(255, 26, 139, 167), width: 2),
              ),
              child: const Center(
                child: Text(
                  "Sekreter Girişi",
                  style: TextStyle(
                    color: Color.fromARGB(255, 26, 139, 167),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
