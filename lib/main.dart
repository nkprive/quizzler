import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz.dart';
import 'scores.dart';

void main() => runApp(Quizzler());

var quiz = Quiz();
var scores = Scores();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void validateQuestion(input) {
    setState(() {
      if (input == quiz.getQuestionAnswer()) {
        // set correct answer
        scores.addScore(true);
      } else {
        // set wrong answer
        scores.addScore(false);
      }

      // load next scene (either next question or result screen)
      if (quiz.lastQuestion) {
        final scoreCount = scores.correctCount;
        final quizLength = quiz.questions.length;

        quiz.reset();
        scores.reset();

        _showResults(context, scoreCount, quizLength);
      } else {
        quiz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                validateQuestion(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                validateQuestion(false);
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scores.scores,
        )
      ],
    );
  }

  _showResults(context, scoreCount, quizLength) {
    var desc = '';

    if (scoreCount > 1) {
      desc = '$scoreCount out of $quizLength are correct!';
    } else {
      desc = '$scoreCount out of $quizLength is correct!';
    }

    Alert(
        context: context,
        padding: EdgeInsets.all(10.0),
        title: "Result",
        desc: desc,
        buttons: [
          DialogButton(
            child: Text(
              "TRY AGAIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          )
        ],
        style: AlertStyle(
          backgroundColor: Colors.grey.shade900,
          animationType: AnimationType.grow,
          isCloseButton: false,
          isOverlayTapDismiss: true,
          descStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          descTextAlign: TextAlign.start,
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: Colors.grey.shade900,
            ),
          ),
          titleStyle: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          alertAlignment: Alignment.center,
        )).show();
  }
}
