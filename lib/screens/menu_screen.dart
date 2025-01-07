import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'rule_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 218, 255, 228),
        ),
        child: Stack(
          children: [
            // Gambar latar belakang horizontal
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),

            // Konten utama
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/image/logo.png'),
                        width: screenWidth * 0.156,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.066),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/image/button.png', // Ganti dengan path tombol gambar
                      width: screenWidth * 0.156, // Atur ukuran gambar tombol
                      height: screenHeight * 0.094,
                    ),
                  ),
                   SizedBox(height: screenHeight * 0.018),
                ],
              ),
            ),

            // Tombol gambar di pojok kanan atas
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.0083), // Jarak dari tepi
                child: InkWell(
                  onTap: () {
                    showRulesModal(context);
                  },
                  child: Image.asset(
                    'assets/image/rule.png', // Ganti dengan path gambar tombol
                    width: screenWidth * 0.026, // Ukuran tombol gambar
                    height: screenHeight * 0.047,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
