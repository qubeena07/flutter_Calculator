import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTap;

  MyButton({Key? key, this.color, this.textColor, required this.buttonText,this.buttonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:buttonTap,
      child:Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          )),
    ),
    );
  }
}
