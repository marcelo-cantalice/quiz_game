import 'package:flutter/cupertino.dart';

class Question {
  String question = "";
  String option_one = "";
  String option_two = "";
  String option_three = "";
  String correct_answer = "";
  bool question_answered = false;

  get questionanswered => this.question_answered;
  String get getQuestion => this.question;

  set setQuestion(String question) => this.question = question;

  get optionone => this.option_one;

  set optionone(value) => this.option_one = value;

  get optiontwo => this.option_two;

  set optiontwo(value) => this.option_two = value;

  get optionthree => this.option_three;

  set optionthree(value) => this.option_three = value;

  get correctanswer => this.correct_answer;

  set correctanswer(value) => this.correct_answer = value;

  Question(Question, Option1, Option2, Option3, correct) {
    this.question = Question;
    this.option_one = Option1;
    this.option_two = Option2;
    this.option_three = Option3;
    this.correct_answer = correct;
    this.question_answered = false;
  }
}
