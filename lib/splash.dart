import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calculator_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => texts()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.orangeAccent,
                Colors.redAccent,
                Colors.blueAccent
              ])),
          child: Center(
            child: Lottie.network(
                // 'https://assets9.lottiefiles.com/packages/lf20_rj9gjnch.json',
                'https://assets5.lottiefiles.com/packages/lf20_yczklbgc.json',
                repeat: false),
          ),

          // reverse: false
          // SpinKitWave(
          //   color: Colors.white,
          //   size: 50,
          // ),
        ),
      ),
    );
  }
}

class texts extends StatefulWidget {
  const texts({Key? key}) : super(key: key);

  @override
  State<texts> createState() => _textsState();
}

class _textsState extends State<texts> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.orangeAccent,
            Colors.redAccent,
            Colors.blueAccent
          ])),
      child: Center(
          child: AnimatedTextKit(animatedTexts: [
        TypewriterAnimatedText("POCKET",
            speed: Duration(milliseconds: 150),
            textStyle: TextStyle(
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white70)),
        TypewriterAnimatedText("CALCULATOR",
            speed: Duration(milliseconds: 150),
            textStyle: TextStyle(
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white70)),
      ])),
    );
  }
}
