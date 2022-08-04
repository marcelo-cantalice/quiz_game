import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_game/Game.dart';
import 'Question.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int number_question = 0;
  List<Question> questions = [
    Question("Question1", "Option1", "Option2", "Option3", "Option1"),
    Question("Question2", "Option1", "Option2", "Option3", "correct"),
    Question("Question3", "Option1", "Option2", "Option3", "correct"),
  ];

  //Analyze if the answer is correct
  answerChecker(player_answer, correct_answer) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Welcome to QUIZ GAME! ",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Text(
                  "LET'S START!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
