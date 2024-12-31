// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:katakita/screens/home_screen.dart';
import 'create_room_screen.dart';
import '../screens/rule_screen.dart';

class JoinRoomScreen extends StatefulWidget {

  const JoinRoomScreen({super.key});

  @override
  _JoinRoomScreenState createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {

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
                builder: (context) => HomeScreen(),
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
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 218, 255, 228),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 300),
                // Username Input Field
                Container(
                  width: 500, // Atur lebar sesuai kebutuhan
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 255, 228),
                    border: Border.all(color: Color.fromARGB(255, 11, 73, 128), width: 5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Room Code',
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 11, 73, 128),
                      fontSize: 18,
                    ),
                  ),
                ),
        
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CreateRoomScreen(),
              ),
            );},
                  child: Container(
                  width: 500, // Atur lebar sesuai kebutuhan
                  height: 150, // Atur tinggi sesuai kebutuhan
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/join2.png'), // Gambar tombol Join
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    // Tempatkan widget lain di sini jika diperlukan, seperti teks
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

}
