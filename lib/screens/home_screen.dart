import 'package:flutter/material.dart';
import '../pregame_screen/join_room_screen.dart';
import '../pregame_screen/create_room_screen.dart';
import 'menu_screen.dart';
import 'rule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // Variabel untuk mengatur jarak antar tombol
  final double buttonSpacing = 20.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 218, 255, 228),
  leading: IconButton(
    icon: Image.asset(
      'assets/image/Back.png', // Gambar khusus untuk tombol kembali
      width: screenWidth * 0.026, // Lebar gambar
      height: screenHeight * 0.047, // Tinggi gambar
    ),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MenuScreen(),
        ),
      );
    },
  ),
  actions: [
    IconButton(
      icon: Image.asset(
        'assets/image/rule.png', // Gambar untuk tombol di pojok kanan
        width: screenWidth * 0.026, // Lebar gambar
      height: screenHeight * 0.047, // Tinggi gambar
      ),
      onPressed: () {
        showRulesModal(context);
      },
    ),
  ],
),

      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 218, 255, 228),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0026, vertical: screenHeight * 0.0227),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: screenHeight * 0.236),
               Text(
                "Username",
                style: TextStyle(
                  fontSize: screenWidth * 0.012,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 73, 128),
                ),
              ),
              SizedBox(height: screenWidth * 0.0283),
              // Username Input Field
              Container(
                width: screenWidth * 0.234, // Lebar kolom TextField dipendekkan
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0026),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 255, 228),
                  border: Border.all(color: Color.fromARGB(255, 11, 73, 128), width: screenWidth * 0.0026),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Player 1',
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 73, 128),
                    fontSize: screenWidth * 0.0093,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.094),
              // Row for Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Join Room Button
                  GestureDetector(
                    onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JoinRoomScreen(),
                          ),
                        );
                    },
                    child: SizedBox(
                      height: screenHeight * 0.189,
                      width: screenWidth * 0.156,
                      child: Image.asset(
                        'assets/image/join_button.png', // Ikon untuk tombol Join Room
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Jarak antara tombol (dapat diubah)
                  SizedBox(width: screenWidth * 0.078),
                  // Create Room Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateRoomScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: screenHeight * 0.189,
                      width: screenWidth * 0.156,
                      child: Image.asset(
                        'assets/image/create_button.png', // Ikon untuk tombol Create Room
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
