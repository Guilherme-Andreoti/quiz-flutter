import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz/views/quizView.dart';
import 'package:share/share.dart';

class FinishDialog {
  static Future show(
    BuildContext context, {
    int hitNumber,
  }){
    return showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            backgroundColor: Colors.grey.shade900,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: IconButton(
              // icon: FaIcon(FontAwesomeIcons.surprise),
              icon: FaIcon(hitNumber < 6 ? FontAwesomeIcons.thumbsDown : FontAwesomeIcons.handPointRight),
              onPressed: (){},
              color: Colors.grey.shade900,
            ),
          ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Parabéns',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Você acertou $hitNumber de 12!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Que tal tentar mais uma vez? Quem sabe você consegue ser mais patriota na próxima!',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            actions: [
            FlatButton(
              child: const Text('COMPARTILHAR'),
              onPressed: () {
                Share.share('Bolsoquiz: Você acertou $hitNumber de 12!');
              },
            ),
            FlatButton(
              child: const Text('JOGAR NOVAMENTE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => quizView()),
                );
              },
            ),
            FlatButton(
              child: const Text('SAIR'),
              onPressed: () {
                SystemNavigator.pop();
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