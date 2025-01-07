// ignore_for_file: unnecessary_string_interpolations, library_private_types_in_public_api, deprecated_member_use, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'dart:async';
import '../pregame_screen/create_room_screen.dart';
import 'finish_game_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class DonutPainter extends CustomPainter {
  final double size; // Ukuran donat
  final Color color; // Warna donat

  DonutPainter(this.size, this.color);

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final paint = Paint()
      ..color = color.withOpacity(0.7) // Membuat warna lebih halus
      ..style = PaintingStyle.stroke
      ..strokeWidth = 100; // Ketebalan donat diperbesar

    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final radius = size / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  bool isCollectingAnswers = false; // Apakah di tahap pengumpulan jawaban
  int countdown = 1; // Hitungan mundur awal
  String targetWord = 'CAHAYA'; // Kata target
  String userInput = ''; // Input pengguna
  Timer? countdownTimer; // Timer untuk hitungan mundur
  bool isCountdownActive = true; // Menandakan apakah countdown sedang aktif
  bool isDuplicateAnswer(int playerNumber, String answer, Map<int, String> playerAnswers) {
  return playerAnswers.values
      .where((a) => a == answer && playerAnswers.keys.elementAt(playerAnswers.values.toList().indexOf(a)) != playerNumber)
      .isNotEmpty;
}
late AnimationController _controller;
late Animation<double> _circleSize;
Timer? finishTimer;




 @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Inisialisasi animasi ukuran donat
    _circleSize = Tween<double>(begin: 0, end: 5000).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Hilangkan animasi setelah selesai
        setState(() {});
      }
    });

    startCountdown();
  }

  void triggerDonutAnimation() {
    _controller.forward(from: 0); // Mulai animasi dari awal
  }


@override
void dispose() {
  _controller.dispose(); // Hentikan animasi
  countdownTimer?.cancel();
  finishTimer?.cancel(); // Batalkan timer pindah halaman
  super.dispose();
}


bool areAllAnswersSame(Map<int, String> playerAnswers) {
  return playerAnswers.values.toSet().length == 1;
}

  void startCountdown() {
    countdown = 3; // Set ulang ke hitungan mundur persiapan
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel(); // Hentikan timer saat hitungan selesai
          isCountdownActive = false; // Beralih ke tampilan input kata
          startAnswerCountdown(); // Mulai timer untuk mengirim jawaban
        }
      });
    });
  }

  void startAnswerCountdown() {
    countdown = 10; // Set durasi waktu menjawab
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel(); // Hentikan timer saat waktu menjawab habis
          submitAnswer(); // Kirim jawaban otomatis
        }
      });
    });
  }

  void submitAnswer() {
    setState(() {
      isCollectingAnswers = true; // Pindah ke tampilan pengumpulan jawaban
    });
  }

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
                    countdownTimer?.cancel();
                    finishTimer?.cancel(); // Batalkan timer sebelumnya jika ada
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
  actions: [
    Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.0083), // Jarak dari tepi kanan
      child: Center(
        child: Text(
          'Stage 1/10', // Ubah teks sesuai kebutuhan
          style: TextStyle(
            fontSize: screenWidth * 0.0093,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 73, 128),
          ),
        ),
      ),
    ),
  ],
),



      body: SizedBox.expand(
        child: Container(
          color: const Color.fromARGB(255, 218, 255, 228),
          child: isCollectingAnswers
              ? buildCollectingAnswers()
              : isCountdownActive
                  ? buildstage()
                  : buildInputWord(),
        ),
      ),
    );
  }

Widget buildstage() {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
  return Align(
    alignment: Alignment(0, -10), // Atur posisi vertikal countdown lebih ke atas
    child: Text(
      'STAGE 1/10',
      style:TextStyle(
        fontSize: screenWidth * 0.025,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 11, 73, 128),
      ),
    ),
  );
}


  Widget buildInputWord() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       SizedBox(height: screenHeight * 0.022),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(
            Icons.timer, // Ikon jam
            color: Color.fromARGB(255, 11, 73, 128),
            size: screenWidth * 0.015, // Ukuran ikon
          ),
           SizedBox(width: screenWidth * 0.0041), // Jarak antara ikon dan teks countdown
          Text(
            '$countdown',
            style: TextStyle(
              fontSize: screenWidth * 0.0125,
              color: Color.fromARGB(255, 11, 73, 128),
            ),
          ),
        ],
      ),
      SizedBox(height: screenHeight * 0.189),
      Text(
        '$targetWord',
        style: TextStyle(
          fontSize: screenWidth * 0.026,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 73, 128),
        ),
      ),
       SizedBox(height: screenHeight * 0.189),
      Container(
        width: screenWidth * 0.234,
        padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.0026),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 218, 255, 228),
          border: Border.all(
            color: const Color.fromARGB(255, 11, 73, 128),
            width: screenWidth * 0.0026,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: '...',
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 11, 73, 128),
            fontSize: screenWidth * 0.0093,
          ),
          onChanged: (value) {
            userInput = value; // Simpan input pengguna
          },
        ),
      ),
    ],
  );
}


Widget buildCollectingAnswers() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
  Map<int, String> playerAnswers = {
    1: userInput.toUpperCase(),
    2: 'SINAR',
    3: 'SINAR',
    4: 'SINAR',
  };

  // Cari semua jawaban yang duplikat
  Set<String> duplicateAnswers = findDuplicateAnswers(playerAnswers.map(
    (key, value) => MapEntry(key, value.toUpperCase()),
  ));

  // Cek apakah semua jawaban sama
  bool allAnswersSame = areAllAnswersSame(playerAnswers.map(
    (key, value) => MapEntry(key, value.toUpperCase()),
  ));

  if (allAnswersSame) {
    _controller.forward(); // Mulai animasi jika semua jawaban sama
  }

   // Timer hanya menyala jika semua jawaban terkumpul
    if (finishTimer == null || !finishTimer!.isActive) {
      finishTimer?.cancel(); // Batalkan timer sebelumnya jika ada
      finishTimer = Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FinishGameScreen()),
        );
      });
    }

  return Stack(
    children: [
      Column(
        children: [
          SizedBox(height: screenHeight * 0.094),
          Text(
            '$targetWord',
            style: TextStyle(
              fontSize: screenWidth * 0.026,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 73, 128),
            ),
          ),
          SizedBox(height: screenHeight * 0.0094),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildPlayerAnswerBox(1, playerAnswers[1]!, duplicateAnswers),
                  buildPlayerAnswerBox(2, playerAnswers[2]!, duplicateAnswers),
                ],
              ),
              SizedBox              
              (height: screenHeight * 0.0094),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
              Row(    
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildPlayerAnswerBox(3, playerAnswers[3]!, duplicateAnswers),
                  buildPlayerAnswerBox(4, playerAnswers[4]!, duplicateAnswers),
                ],
              ),
            ],
          ),
        ],
      ),
      if (allAnswersSame)
        Center(
          child: AnimatedBuilder(
            animation: _circleSize,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: DonutPainter(_circleSize.value, Colors.green),
              );
            },
          ),
        ),
    ],
  );
}


Widget buildPlayerAnswerBox(int playerNumber, String answer, Set<String> duplicateAnswers) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
  bool isDuplicate = duplicateAnswers.contains(answer);

  return Column(
    children: [
      Text(
        'Player $playerNumber',
        style: TextStyle(
          fontSize: screenWidth * 0.0093,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 73, 128),
        ),
      ),
      SizedBox(height: screenHeight * 0.018),
      Container(
        width: screenWidth * 0.156, // Tetapkan lebar tetap
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: isDuplicate
                ? const Color.fromARGB(255, 54, 185, 45) // Warna merah untuk jawaban duplikatrgba(54, 185, 45, 1)
                : const Color.fromARGB(255, 119, 134, 148), // Warna normal
            width: screenWidth * 0.0026,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.023,
        ),
        child: Center( // Teks berada di tengah
          child: Text(
            answer,
            style: TextStyle(
              fontSize: screenWidth * 0.0104,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 73, 128),
            ),
          ),
        ),
      ),
    ],
  );
}


Set<String> findDuplicateAnswers(Map<int, String> playerAnswers) {
  // Mencari semua jawaban yang muncul lebih dari satu kali
  Map<String, int> answerCounts = {};
  playerAnswers.values.forEach((answer) {
    answerCounts[answer] = (answerCounts[answer] ?? 0) + 1;
  });
  return answerCounts.keys.where((answer) => answerCounts[answer]! > 1).toSet();
}


}
