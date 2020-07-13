import 'package:flutter/material.dart';
import 'Views/quizView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz COVID-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: quizView(),
    );
  }
}