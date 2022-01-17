import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scores {
  List<Icon> _scores = [];

  int _correctCount = 0;

  // Template for correct answer icon
  Icon _correct = Icon(
    Icons.check,
    color: Colors.green,
  );

  // Template for wrong answer icon
  Icon _wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  void addScore(bool score) {
    if (score) {
      // correct answer

      _scores.add(_correct);
      _correctCount++;
    } else {
      // wrong answer
      _scores.add(_wrong);
    }

    print(_correctCount);
  }

  List get scores {
    return _scores;
  }

  int get correctCount {
    return _correctCount;
  }

  void reset() {
    _scores = [];
    _correctCount = 0;
  }
}
