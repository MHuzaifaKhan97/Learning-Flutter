import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
// this syntax called MAP and can used either {} or Map(key,value)
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Black', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pulao', 'score': 10},
        {'text': 'Pizza', 'score': 5},
        {'text': 'Pasta', 'score': 3},
        {'text': 'Biryani', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Net Ninja', 'score': 5},
        {'text': 'Meed', 'score': 3},
        {'text': 'Andrew', 'score': 1}
      ],
    },
  ];

  void _answerFunction(int score) {
    if (_questionIndex < _questions.length) {
      _totalScore += score;
      setState(() {
        _questionIndex += 1;
      });
      print(_questionIndex);
    }
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text('Quiz Application')),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerFunction: _answerFunction,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, resetQuiz)));
  }
}
