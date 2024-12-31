// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';
//import 'game_screen/game_screen.dart';

void main() {
  runApp(const katakita());
}

class katakita extends StatelessWidget {
   // ignore: use_super_parameters
   const katakita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kata Kita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MenuScreen(),
    );
  }
}

