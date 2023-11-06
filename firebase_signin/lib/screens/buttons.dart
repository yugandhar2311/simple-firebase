import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttonTappeed;
  Button(
      {required this.buttontext,
      this.color,
      this.textcolor,
      this.buttonTappeed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTappeed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: color,
              child: Center(
                  child: Text(
                buttontext,
                style: TextStyle(color: textcolor, fontSize: 18),
              )),
            )),
      ),
    );
  }
}
