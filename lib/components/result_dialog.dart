import 'package:flutter/material.dart';
import 'package:quiz/Models/questions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ResultDialog {
  static Future show(
    BuildContext context, {
    @required Question question,
    @required bool correct,
    @required Function onNext,
  }) {
    return showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            backgroundColor: Colors.grey.shade900,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: CircleAvatar(
            backgroundColor: correct ? Colors.green : Colors.red,
            child: IconButton(
              // icon: FaIcon(FontAwesomeIcons.surprise),
              icon: FaIcon(correct ? FontAwesomeIcons.thumbsUp : FontAwesomeIcons.thumbsDown),
              onPressed: (){},
              color: Colors.grey.shade900,
            ),
          ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  question.question,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  correct ? 'Bolsonaro te deu parabéns!' : 'Bolsonaro não concorda! O correto',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: correct ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  question.answer1,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: const Text('PRÓXIMO'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onNext();
                },
              )
            ],
          ),
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {});
  }
}