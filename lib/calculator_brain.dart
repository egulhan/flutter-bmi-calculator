import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  double _bmi;
  final double weight;
  final double height;

  CalculatorBrain({@required this.weight, @required this.height});

  String calculate() {
    this._bmi = this.weight / pow(this.height / 100, 2);
    return this._bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (this._bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (this._bmi >= 18.5 && this._bmi <= 24.5) {
      return 'NORMAL';
    } else if (this._bmi >= 25 && this._bmi <= 29.9) {
      return 'OVERWEIGHT';
    } else {
      return 'VERY OVERWEIGHT';
    }
  }

  String getResultMessage() {
    if (this._bmi < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (this._bmi >= 18.5 && this._bmi <= 24.5) {
      return 'You have a normal body weight. Good job!';
    } else if (this._bmi >= 25 && this._bmi <= 29.9) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else {
      return 'You have a very bad body. Try to exercise more than you do!';
    }
  }
}
