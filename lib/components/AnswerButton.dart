import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;

  const AnswerButton(this.answer);

  Widget build(BuildContext context) {
     return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.blue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            return 'tap';
          }
        ),
      ),
    );
  }
}