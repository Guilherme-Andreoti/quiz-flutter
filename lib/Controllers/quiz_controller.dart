import 'dart:math';

import 'package:quiz/Models/questions.dart';
import 'package:quiz/Services/quiz_api.dart';

class QuizController { 
  List<Question> _questionBank; 
  int questionIndex; 
  int hitNumber; 
  Random _random = Random(); 
  bool _shiftAnswer; 
  

  int get questionsNumber => _questionBank.length ?? 0; 
  Question get question => _questionBank[questionIndex];

  initialize() async{
    questionIndex = 0; 
    hitNumber = 0; 
    _questionBank = await QuizApi.fetch(); 
    _questionBank.shuffle(); 
    
    _shiftAnswer = _random.nextBool(); 
  }

  String getQuestion(){
    return question.question; 
  }

  String getAnswer1(){
    return _shiftAnswer ? question.answer1 : question.answer2; 
  }

  String getAnswer2(){
     return _shiftAnswer ? question.answer2 : question.answer1;
  }

  bool correctAnswer(String answer){
    var correct = question.answer1 == answer; 
    hitNumber = hitNumber + (correct ? 1 : 0); 
    return correct; 
  }

  void nextQuestion(){
    questionIndex++;
    _shiftAnswer = _random.nextBool();
  }

}

