import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/buttons.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQus = "";
  var userAns = "";
  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'aaa',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(userQus,style: TextStyle(fontSize: 20))),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(userAns,style: TextStyle(fontSize: 20),),)
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                    //color: Colors.deepOrangeAccent,
                    child: GridView.builder(
                        itemCount: buttons.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Button(
                                buttonTappeed: () {
                                  setState(() {
                                    userQus = '';
                                    userAns="";
                                  });
                                },
                                buttontext: buttons[index],
                                color: Color.fromARGB(255, 11, 12, 12),
                                textcolor: Colors.white);
                          } else if (index == 1) {
                            return Button(
                                buttonTappeed: () {
                                  setState(() {
                                    
                                    userQus = userQus.substring(
                                        0, userQus.length - 1);
                                    
                                  });
                                },
                                buttontext: buttons[index],
                                color: Color.fromARGB(255, 241, 3, 3),
                                textcolor: Colors.white);
                          } else if (index == buttons.length - 1) {
                            return Button(
                                buttonTappeed: () {
                                  setState(() {
                                    equalpressed();
                                  });
                                },
                                buttontext: buttons[index],
                                color: Color.fromARGB(255, 241, 3, 3),
                                textcolor: Colors.white);
                          } else {
                            return Button(
                              buttonTappeed: () {
                                setState(() {
                                  userQus += buttons[index];
                                });
                              },
                              buttontext: buttons[index],
                              color: isoper(buttons[index])
                                  ? Colors.deepPurple
                                  : Colors.deepPurple[50],
                              textcolor: isoper(buttons[index])
                                  ? Colors.white
                                  : Colors.deepPurple,
                            );
                          }
                        })))
          ],
        ),
      ),
    );
  }
  bool isoper(String x) {
  if (x == '%' || x == '*' || x == '-' || x == '=' || x == '/' || x == '+') {
    return true;
  } else {
    return false;
  }  
  
}
void equalpressed() {
    String finalqustion=userQus;
    Parser p = Parser();
    Expression exp = p.parse(finalqustion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAns =eval.toString();
  
  }
  
}
