import 'package:calculator_app/home.dart';
import 'package:calculator_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(Calculator(showHome: showHome));
}

class Calculator extends StatelessWidget {
  final bool showHome;
  const Calculator({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: "Pocket Calculator",
      home: showHome ? home() : splash(),
    );
  }
}
