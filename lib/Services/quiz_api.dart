import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/Models/questions.dart';

class QuizApi {

  static Future<List<Question>> fetch() async {
    try {
      var url = "https://script.google.com/macros/s/AKfycbxSnGfqPR4-SExTre5RMJEd8zxIqzTK7V4V2hM3VbQdhdakzLk/exec";
      var response = await http.get(url);

      if (response.statusCode == 200){
        var data = json.decode(response.body);
        return List<Question>.from(data['questions'].map((q) => Question.fromMap(q)));   
      }else{
        return List<Question>(); 
      }
    } catch(error) {
      print(error); 
      return List<Question>();  
    }


  }



}