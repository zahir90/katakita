import 'package:flutter/material.dart';
import 'package:katakita/game_screen/game_screen.dart';
import '../pregame_screen/create_room_screen.dart';

class FinishGameScreen extends StatelessWidget {

  const FinishGameScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 218, 255, 228),
  leading: IconButton(
    icon: Image.asset(
      'assets/image/Back.png',
      width: 50,
      height: 50,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Apa anda ingin \n membatalkan \n permainan?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50,
              fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 73, 128)
              ),
            ),
            const SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Tutup dialog
                  },
                  child: Image.asset(
                    'assets/image/tidak_button.png',
                    width: 250,
                    height: 150,
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
                    width: 250,
                    height: 150,
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
              width: 800,
              height: 500,
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                  const Text(
                    'Total Stage',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                  Text(
                    '10 STAGE',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    'Skor',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                  Text(
                    '10',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B4980), // Warna teks
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
                  onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameScreen(),
              ),
            );},
                  child: Container(
                  width: 500, // Atur lebar sesuai kebutuhan
                  height: 150, // Atur tinggi sesuai kebutuhan
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
