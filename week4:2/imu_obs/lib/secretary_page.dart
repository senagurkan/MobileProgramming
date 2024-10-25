import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imu_obs/main.dart';
import 'teacher_page.dart';

class SecretaryPage extends StatelessWidget {
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
              Color(0xFF512DA8),
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
                            "Sekreter Girişi",
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
                      _buildInputField("E-Posta", false),
                      _buildInputField("Parola", true),
                      const SizedBox(height: 40),
                      _buildLoginButton(),
                      const SizedBox(height: 50),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: Text(
                          "Öğretmen veya Öğrenci Olarak Devam Edin",
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

  Widget _buildLoginButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1600),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 199, 186, 231),
                Color(0xFF512DA8),
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

  Widget _buildInputField(String hint, bool isPassword) {
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
                side: const BorderSide(color: Color(0xFF512DA8), width: 2),
              ),
              child: const Center(
                child: Text(
                  "Öğretmen Girişi",
                  style: TextStyle(
                    color: Color(0xFF512DA8),
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              height: 50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: Color(0xFF512DA8), width: 2),
              ),
              child: const Center(
                child: Text(
                  "Öğrenci Girişi",
                  style: TextStyle(
                    color: Color(0xFF512DA8),
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
