import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                    print(number_question.toString() + "---");
                    if (number_question < questions.length - 1) {
                      number_question++;
                    } else {
                      print("Last Question");
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
