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
                  const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/image/logo.png'),
                        width: 300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
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
                      width: 300, // Atur ukuran gambar tombol
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Tombol gambar di pojok kanan atas
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Jarak dari tepi
                child: InkWell(
                  onTap: () {
                    showRulesModal(context);
                  },
                  child: Image.asset(
                    'assets/image/rule.png', // Ganti dengan path gambar tombol
                    width: 50, // Ukuran tombol gambar
                    height: 50,
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
