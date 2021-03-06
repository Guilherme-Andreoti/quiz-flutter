import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz/Controllers/quiz_controller.dart';
import 'package:quiz/components/centered_circular_progress.dart';
import 'package:quiz/components/centered_message.dart';
import 'package:quiz/components/finish_dialog.dart';
import 'package:quiz/components/QuestionContainer.dart';
import 'package:quiz/components/result_dialog.dart';

class quizView extends StatefulWidget {
  @override
  _quizViewState createState() => _quizViewState();
}

class _quizViewState extends State<quizView> {
final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('BOLSOQUIZ ( ${_scoreKeeper.length}/12 )'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildQuiz(),
        ),
      ),
    );
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionsNumber == 0)
      return CenteredMessage(
        'Sem questões',
        icon: FontAwesomeIcons.exclamationTriangle,
      );
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        QuestionContainer(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildScoreKeeper(),
      ],
    );
  }



  _buildAnswerButton(String answer) {
    return Expanded(
      child: Padding(
        padding: AnswerButton(),
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
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _scoreKeeper.add(
                     IconButton(

                      icon: FaIcon(correct ? FontAwesomeIcons.thumbsUp : FontAwesomeIcons.thumbsDown),
                      iconSize: 16.0,
                      onPressed: (){},
                      padding:EdgeInsets.all(1.0),
                      
                      color: correct ? Colors.green : Colors.red,
                      
                    ),
                  );

                  if (_scoreKeeper.length < 12) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(
                      context,
                      hitNumber: _controller.hitNumber,
                    );
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  EdgeInsets AnswerButton() => EdgeInsets.symmetric(vertical: 8.0);

  _buildScoreKeeper() {
    return Expanded(
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2, // to apply margin in the main axis of the wrap
        runSpacing: 2, 
        children: _scoreKeeper,
      ),
    );
  }

  
}
