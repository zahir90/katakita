// ignore_for_file: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katakita/game_screen/game_screen.dart';
import '../screens/rule_screen.dart';
import '../screens/home_screen.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final roomCode = "ABCD"; // Room code statis
    final List<String> players = [
      "PLAYER 1",
      "PLAYER 2",
      "PLAYER 3",
      "PLAYER 4"
    ]; // Daftar pemain statis

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 255, 228),
        leading: IconButton(
          icon: Image.asset(
            'assets/image/Back.png',
            width: screenWidth * 0.026,
            height: screenHeight * 0.047,
          ),
          onPressed: () {
            showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Tambahkan radius jika perlu
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4, // 80% dari lebar layar
        height: MediaQuery.of(context).size.height * 0.6, // 40% dari tinggi layar
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 218, 255, 228), // Warna latar
          borderRadius: BorderRadius.circular(20), // Radius tepi
        ),
        padding: EdgeInsets.all(screenWidth * 0.0083),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: screenHeight * 0.018),
            Text(
              'Apa anda ingin \n membubarkan \n ruangan?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.026,
              fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 73, 128)
              ),
            ),
            SizedBox(height: screenHeight * 0.018),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Tutup dialog
                  },
                  child: Image.asset(
                    'assets/image/tidak_button.png',
                    width: screenWidth * 0.130,
                    height: screenHeight * 0.141,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/image/iya_button.png',
                    width: screenWidth * 0.130,
                    height: screenHeight * 0.141,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);

          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/image/rule.png',
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
        padding: EdgeInsets.all(screenWidth * 0.0083),
            child: Column(
              children: [
                // Room Code Section
                Container(
        padding: EdgeInsets.all(screenWidth * 0.0083),
                  width: screenWidth * 0.260,
                  decoration: BoxDecoration(
                    color: const Color(0xFF62D660), // Warna hijau
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Kode Ruangan :',
                        style: TextStyle(
                          fontSize: screenWidth * 0.0093,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 73, 128),
                          fontFamily: 'boldfont'
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.0075),
                      Text(
                        roomCode,
                        style: TextStyle(
                          fontSize: screenWidth * 0.014,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Players Section
                Container(
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 71, 135, 224), // Warna biru
  ),
  width: screenWidth * 0.260, // Lebar tetap untuk kotak
  height: screenHeight * 0.567,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      for (int i = 0; i < players.length; i++) ...[
        SizedBox(
          width: screenWidth * 0.260, // Memastikan garis selebar kotak
          height: screenHeight * 0.0047, // Ketebalan garis
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 73, 128),
              borderRadius: BorderRadiusDirectional.circular(50)
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0539), // Padding vertikal untuk memberi jarak
          child: Text(
            players[i],
            style: TextStyle(
              fontSize: screenWidth * 0.0104,
              fontFamily: 'boldfont',
              color: Colors.white,
            ),
          ),
        ),
      ],
    ],
  ),
  
),

// Tambahkan teks di bawah kotak pemain
SizedBox(height: screenHeight * 0.0473), // Spasi antara kotak pemain dan teks
InkWell(
                  onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameScreen(),
              ),
            );},
                  child: Container(
                  width: screenWidth * 0.260, // Atur lebar sesuai kebutuhan
                  height: screenHeight * 0.141, // Atur tinggi sesuai kebutuhan
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/play_button2.png'), // Gambar tombol Join
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
