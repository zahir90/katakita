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
    Padding(
      padding: const EdgeInsets.only(right: 16.0), // Jarak dari tepi kanan
      child: Center(
        child: Text(
          'Stage 1/10', // Ubah teks sesuai kebutuhan
          style: const TextStyle(
            fontSize: 18,
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
  return Align(
    alignment: Alignment(0, -0.10), // Atur posisi vertikal countdown lebih ke atas
    child: Text(
      'STAGE 1/10',
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 11, 73, 128),
      ),
    ),
  );
}


  Widget buildInputWord() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.timer, // Ikon jam
            color: Color.fromARGB(255, 11, 73, 128),
            size: 30, // Ukuran ikon
          ),
          const SizedBox(width: 8), // Jarak antara ikon dan teks countdown
          Text(
            '$countdown',
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 11, 73, 128),
            ),
          ),
        ],
      ),
      const SizedBox(height: 200),
      Text(
        '$targetWord',
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 73, 128),
        ),
      ),
      const SizedBox(height: 200),
      Container(
        width: 450,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 218, 255, 228),
          border: Border.all(
            color: const Color.fromARGB(255, 11, 73, 128),
            width: 5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: '...',
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 11, 73, 128),
            fontSize: 18,
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
          const SizedBox(height: 100),
          Text(
            '$targetWord',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 11, 73, 128),
            ),
          ),
          const SizedBox(height: 150),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildPlayerAnswerBox(1, playerAnswers[1]!, duplicateAnswers),
                  buildPlayerAnswerBox(2, playerAnswers[2]!, duplicateAnswers),
                ],
              ),
              const SizedBox(height: 150),
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
  bool isDuplicate = duplicateAnswers.contains(answer);

  return Column(
    children: [
      Text(
        'Player $playerNumber',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 73, 128),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        width: 300, // Tetapkan lebar tetap
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: isDuplicate
                ? const Color.fromARGB(255, 54, 185, 45) // Warna merah untuk jawaban duplikatrgba(54, 185, 45, 1)
                : const Color.fromARGB(255, 119, 134, 148), // Warna normal
            width: 5,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Center( // Teks berada di tengah
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 20,
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
