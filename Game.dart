import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Question.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int number_question = 0;
  List<Question> questions = [
    Question("Question1", "Option1", "Option2", "Option3", "Option1"),
    Question("Question2", "Option1", "Option2", "Option3", "correct"),
    Question("Question3", "Option1", "Option2", "Option3", "correct"),
  ];

  //Analyze if the answer is correct
  answerChecker(player_answer, correct_answer) {
    questions[number_question].question_answered = true;
    if (player_answer == correct_answer) {
      //change answer background(red for incorrect or green for correct)
      //Allow to go to the next question
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Game"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Question Nº " +
                (number_question + 1).toString() +
                "/" +
                questions.length.toString()),
            Text(questions[number_question].getQuestion.toString()),
            ElevatedButton(
                onPressed: () {
                  answerChecker(questions[number_question].option_one,
                      questions[number_question].correct_answer);

                  setState(() {
                    if (number_question < questions.length - 1) {
                      print(number_question.toString() + "---");
                      number_question++;
                      
                    } else if (number_question == questions.length - 1) {
                      print("Don't have more questoins");
                      //Open final window
                    }
                  });
                },
                child: Text(questions[number_question].option_one)),
            ElevatedButton(
                onPressed: () {},
                child: Text(questions[number_question].option_two)),
            ElevatedButton(
                onPressed: () {},
                child: Text(questions[number_question].option_three))
          ],
        ),
      ),
    );
  }
}
