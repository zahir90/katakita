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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 255, 228),
        leading: IconButton(
          icon: Image.asset(
            'assets/image/Back.png', // Gambar khusus untuk tombol kembali
            width: screenWidth * 0.026,
            height: screenHeight * 0.047,
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
      width: screenWidth * 0.026, // Lebar gambar
      height: screenHeight * 0.047, // Tinggi gambar
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0026, vertical: screenHeight * 0.022),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.283),
                // Username Input Field
                Container(
                  width: screenWidth * 0.260, // Atur lebar sesuai kebutuhan
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0026),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 255, 228),
                    border: Border.all(color: Color.fromARGB(255, 11, 73, 128), width: screenWidth * 0.0026),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Room Code',
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 11, 73, 128),
                      fontSize: screenWidth * 0.0093,
                    ),
                  ),
                ),
        
                 SizedBox(height: screenHeight * 0.0094),
                InkWell(
                  onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CreateRoomScreen(),
              ),
            );},
                  child: Container(
                  width: screenWidth * 0.260, // Atur lebar sesuai kebutuhan
                  height: screenHeight * 0.141, // Atur tinggi sesuai kebutuhan
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
