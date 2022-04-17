import 'package:calculator/Orientation/landscape.dart';
import 'package:calculator/Orientation/portrait.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget Button(
      Color btncolor, String btntxt, Color txtcolor, int index, double rad) {
    return ElevatedButton(
      onPressed: () {
        if (index == 0) {
          setState(() {
            expression = "";
            answer = "";
          });
        } else if (index == 1) {
          setState(() {
            expression = expression.substring(0, expression.length - 1);
          });
        } else if (index == 18) {
          setState(() {
            expression = "";
            expression += answer;
          });
        } else if (index == buttontxt.length - 1) {
          equalPressed();
        } else {
          setState(() {
            expression += buttontxt[index];
          });
        }
      },
      child: Text(
        btntxt,
        style: TextStyle(fontSize: 23, color: txtcolor),
      ),
      style: ElevatedButton.styleFrom(
          primary: btncolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(rad))),
    );
  }

  void equalPressed() {
    String finalExpression = expression;
    finalExpression = expression.replaceAll('x', "*");
    finalExpression = finalExpression.replaceAll('÷', "/");
    finalExpression = finalExpression.replaceAll('%', "/100");
    Parser p = Parser();
    try {
      Expression exp = p.parse(finalExpression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        answer = eval.toString();
      });
    } catch (e) {
      setState(() {
        answer = "Syntax Error";
      });
    }
  }

  List<String> buttontxt = [
    "C",
    "DEL",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "–",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "x",
    "0",
    ".",
    "Ans",
    "="
  ];

  String expression = "";
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: OrientationBuilder(
          builder: (((context, orientation) {
            if (orientation == Orientation.landscape) {
              return landscape(context, expression, answer, buttontxt, Button);
            } else {
              return portrait(context, expression, answer, buttontxt, Button);
            }
          })),
        ));
  }
}
