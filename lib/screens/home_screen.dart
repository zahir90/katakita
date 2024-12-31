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
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 218, 255, 228),
  leading: IconButton(
    icon: Image.asset(
      'assets/image/Back.png', // Gambar khusus untuk tombol kembali
      width: 50, // Lebar gambar
      height: 50, // Tinggi gambar
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
        width: 50, // Lebar gambar
        height: 50, // Tinggi gambar
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
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              const Text(
                "Username",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 73, 128),
                ),
              ),
              const SizedBox(height: 30),
              // Username Input Field
              Container(
                width: 450, // Lebar kolom TextField dipendekkan
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 255, 228),
                  border: Border.all(color: Color.fromARGB(255, 11, 73, 128), width: 5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Player 1',
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 11, 73, 128),
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 100),
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
                      height: 200,
                      width: 300,
                      child: Image.asset(
                        'assets/image/join_button.png', // Ikon untuk tombol Join Room
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Jarak antara tombol (dapat diubah)
                  SizedBox(width: 150),
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
                      height: 200,
                      width: 300,
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
