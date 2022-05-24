import 'package:calculator_app/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    '1',
    '2',
    '3',
    'C',
    '4',
    '5',
    '6',
    '+',
    '7',
    '8',
    '9',
    '-',
    '0',
    '/',
    'x',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 30),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal))),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(userAnswer,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 3) {
                          return MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion = ' ';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } //down equals button
                        else if (index == buttons.length - 1) {
                          return MyButton(
                            buttonTap: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.greenAccent[700],
                            textColor: Colors.white,
                          );
                        } else {
                          return MyButton(
                            buttonTap: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepOrangeAccent[200]
                                : Colors.deepOrange[50],
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepOrangeAccent,
                          );
                        }
                      })))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '+' || x == 'x' || x == '-') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
