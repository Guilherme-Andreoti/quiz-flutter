import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    List<Question> questions;

    Welcome({
        this.questions,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    String question;
    String answer1;
    String answer2;

    Question({
        this.question,
        this.answer1,
        this.answer2,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answer1: json["answer1"],
        answer2: json["answer2"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answer1": answer1,
        "answer2": answer2,
    };

    factory Question.fromMap(Map<String, dynamic> json) => Question(
        question: json["question"],
        answer1: json["answer1"],
        answer2: json["answer2"],
    );

    Map<String, dynamic> toMap() => {
        "question": question,
        "answer1": answer1,
        "answer2": answer2,
    };
}