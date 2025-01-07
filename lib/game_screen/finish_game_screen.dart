import 'package:flutter/material.dart';
import 'package:katakita/game_screen/game_screen.dart';
import '../pregame_screen/create_room_screen.dart';

class FinishGameScreen extends StatelessWidget {

  const FinishGameScreen({super.key,});

  @override

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 218, 255, 228),
  leading: IconButton(
    icon: Image.asset(
      'assets/image/Back.png',
      width: screenWidth * 0.026, // Lebar gambar
      height: screenHeight * 0.047, // Tinggi gambar
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
              'Apa anda ingin \n membatalkan \n permainan?',
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
                        builder: (context) => CreateRoomScreen(),
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
),
      backgroundColor: const Color(0xFFDFFFE8), // Warna latar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kotak informasi
            Container(
              width: screenWidth * 0.416,
              height: screenHeight * 0.473,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
              decoration: BoxDecoration(
                color: const Color(0xFFA4F4C3), // Warna kotak
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                   Text(
                    'Total Stage',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0208,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                  Text(
                    '10 STAGE',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0416,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                   SizedBox(height: screenHeight * 0.094),
                   Text(
                    'Skor',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0208,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0416,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: screenHeight * 0.028),
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
    );
  }
}
