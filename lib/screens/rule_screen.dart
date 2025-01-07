import 'package:flutter/material.dart';

void showRulesModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      // Menggunakan MediaQuery untuk mendapatkan tinggi layar
      //final double screenHeight = MediaQuery.of(context).size.height;
      final double screenWidth = MediaQuery.of(context).size.width;

      return Row(
        children: [
          Expanded(child: SizedBox()), // Placeholder untuk Row
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: screenWidth * 0.7, // Lebar penuh dari layar
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 218, 255, 228),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Konten dimulai dari atas
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'CARA BERMAIN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'boldfont',
                          color: Color.fromARGB(255, 11, 73, 128),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'PEMAIN AKAN BERMAIN SECARA TIM YANG \nTERDIRI DARI 4 ORANG.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'boldfont',
                          color: Color.fromARGB(255, 11, 73, 128),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '1. GAME AKAN MEMBERIKAN SEBUAH KATA YANG \n    AKAN DIIKUTI.\n'
                        '2. PEMAIN DIHARUSKAN MENULIS KATA YANG \n    BERHUBUNGAN DARI KATA YANG DIBERIKAN.\n'
                        '3. SETELAH MEMBERIKAN KATA, PEMAIN HARUS \n    KOMPAK DENGAN TIMNYA. KATA DARI \n    MASING-MASING PEMAIN HARUS SAMA.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'boldfont',
                          color: Color.fromARGB(255, 11, 73, 128),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
