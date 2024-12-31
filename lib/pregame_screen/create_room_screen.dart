import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katakita/game_screen/game_screen.dart';
import '../screens/rule_screen.dart';
import '../screens/home_screen.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Apa anda ingin \n membubarkan \n ruangan?',
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
                        builder: (context) => HomeScreen(),
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
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/image/rule.png',
              width: 50,
              height: 50,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Room Code Section
                Container(
                  padding: const EdgeInsets.all(16),
                  width: 500,
                  decoration: BoxDecoration(
                    color: const Color(0xFF62D660), // Warna hijau
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Kode Ruangan :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 73, 128),
                          fontFamily: 'boldfont'
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        roomCode,
                        style: const TextStyle(
                          fontSize: 28,
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
  width: 500, // Lebar tetap untuk kotak
  height: 600,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      for (int i = 0; i < players.length; i++) ...[
        SizedBox(
          width: 500, // Memastikan garis selebar kotak
          height: 5, // Ketebalan garis
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 73, 128),
              borderRadius: BorderRadiusDirectional.circular(50)
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 57), // Padding vertikal untuk memberi jarak
          child: Text(
            players[i],
            style: const TextStyle(
              fontSize: 20,
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
const SizedBox(height: 50), // Spasi antara kotak pemain dan teks
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
        ),
      ),
    );
  }

}
