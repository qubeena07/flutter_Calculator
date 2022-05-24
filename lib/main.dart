import 'package:calculator_app/home.dart';
import 'package:calculator_app/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: "Pocket Calculator",
      home: splash(),
    );
  }
}
