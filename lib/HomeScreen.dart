import 'package:calculator/components/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: true,
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              userInput.toString(),
                              style: const TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              answer.toString(),
                              style: const TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.58,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyButton(
                              title: 'AC',
                              onpress: () {
                                setState(() {
                                  userInput = '';
                                  answer = '';
                                });
                              },
                            ),
                            MyButton(
                              title: '+/-',
                              onpress: () {
                                setState(() {
                                  userInput += '+/-';
                                });
                              },
                            ),
                            MyButton(
                              title: '%',
                              onpress: () {
                                setState(() {
                                  userInput += '%';
                                });
                              },
                            ),
                            MyButton(
                              title: '/',
                              color: const Color(0xffffa00a),
                              onpress: () {
                                setState(() {
                                  userInput += '/';
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '7',
                              onpress: () {
                                setState(() {
                                  userInput += '7';
                                });
                              },
                            ),
                            MyButton(
                              title: '8',
                              onpress: () {
                                setState(() {
                                  userInput += '8';
                                });
                              },
                            ),
                            MyButton(
                              title: '9',
                              onpress: () {
                                setState(() {
                                  userInput += '9';
                                });
                              },
                            ),
                            MyButton(
                              title: 'x',
                              color: const Color(0xffffa00a),
                              onpress: () {
                                setState(() {
                                  userInput += '*';
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '4',
                              onpress: () {
                                setState(() {
                                  userInput += '4';
                                });
                              },
                            ),
                            MyButton(
                              title: '5',
                              onpress: () {
                                setState(() {
                                  userInput += '5';
                                });
                              },
                            ),
                            MyButton(
                              title: '6',
                              onpress: () {
                                setState(() {
                                  userInput += '6';
                                });
                              },
                            ),
                            MyButton(
                              title: '-',
                              color: const Color(0xffffa00a),
                              onpress: () {
                                setState(() {
                                  userInput += '-';
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '1',
                              onpress: () {
                                setState(() {
                                  userInput += '1';
                                });
                              },
                            ),
                            MyButton(
                              title: '2',
                              onpress: () {
                                setState(() {
                                  userInput += '2';
                                });
                              },
                            ),
                            MyButton(
                              title: '3',
                              onpress: () {
                                setState(() {
                                  userInput += '3';
                                });
                              },
                            ),
                            MyButton(
                              title: '+',
                              color: const Color(0xffffa00a),
                              onpress: () {
                                setState(() {
                                  userInput += '+';
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyButton(
                              title: '0',
                              onpress: () {
                                setState(() {
                                  userInput += '0';
                                });
                              },
                            ),
                            MyButton(
                              title: '.',
                              onpress: () {
                                setState(() {
                                  userInput += '.';
                                });
                              },
                            ),
                            MyButton(
                              title: 'DEL',
                              onpress: () {
                                setState(() {
                                  userInput = userInput.substring(0, userInput.length - 1);
                                });
                              },
                            ),
                            MyButton(
                              title: '=',
                              color: const Color(0xffffa00a),
                              onpress: () {
                                setState(() {
                                  equalPress();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput.replaceAll('x', '*'));
    // print(expression);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    setState(() {
      answer = eval.toString();
    });
  }
}
