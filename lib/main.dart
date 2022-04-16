import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget Button(Color btncolor, String btntxt, Color txtcolor, int index) {
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
        style: TextStyle(fontSize: 18, color: txtcolor),
      ),
      style: TextButton.styleFrom(
          backgroundColor: btncolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  void equalPressed() {
    String finalExpression = expression;
    finalExpression = expression.replaceAll('x', "*");
    Parser p = Parser();
    Expression exp = p.parse(finalExpression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      answer = eval.toString();
    });
  }

  List<String> buttontxt = [
    "C",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "-",
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 192, 225, 252),
          Colors.white,
          Color.fromARGB(255, 192, 225, 252),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              expression,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.grey[800],
                                  letterSpacing: 1),
                            ),
                          )),
                    ),
                    Container(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              answer,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                              maxLines: 1,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: GridView.builder(
                    itemCount: buttontxt.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Button(Color.fromARGB(255, 93, 204, 23),
                            buttontxt[index], Colors.white, index);
                      }
                      if (index == 1) {
                        return Button(
                            Colors.red, buttontxt[index], Colors.white, index);
                      }
                      if (index == 4 ||
                          index == 5 ||
                          index == 6 ||
                          index == 8 ||
                          index == 9 ||
                          index == 10 ||
                          index == 12 ||
                          index == 13 ||
                          index == 14 ||
                          index == 16 ||
                          index == 17 ||
                          index == 18) {
                        return Button(Colors.white, buttontxt[index],
                            Color.fromARGB(255, 3, 183, 255), index);
                      }

                      return Button(Color.fromARGB(255, 3, 183, 255),
                          buttontxt[index], Colors.white, index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
