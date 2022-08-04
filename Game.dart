import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Final_Screen.dart';
import 'Question.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int number_question = 0;
  int idQuestion = 0;
  List<Question> questions = [
    Question("How many legs does the Legs of Man have?", "One", "Three", "Four",
        "Three"),
    Question(
        "How many tails does a Manx cat have? ", "None", "One", "Two", "None"),
    Question("How many teeth does an aardvark have? ", "None", "Ten",
        "Fifeteen", "None"),
    Question("Which sea creature has three hearts?", "Shark", "Jellyfish",
        "Octopus", "Octopus"),
    Question("Which instrument has forty-seven strings and seven pedals?",
        "Drum", "Accordion", "Harp", "Harp"),
    Question("Whose face was said to have launched 1,000 ships?",
        "Helen of Troy", "Leonidas of Sparta", "Cleopatra", "Helen of Troy"),
    Question("In the traditional rhyme, how many mice were blind?", "Two",
        "Three", "Five", "Three"),
    Question("How many bones does an adult human have?", "Two hundred and six",
        "Two hundred", "Two hundred and ten", "Two hundred and six"),
    Question("How many pedals do most modern pianos have?", "None", "One",
        "Three", "Three"),
    Question("Water boils at 212 degrees on which temperature scale?",
        "Celsius", "Fahrenheit", "Kelvin", "Fahrenheit"),
  ];
  int correct_questions = 0;
  Color initialButtonColor = Colors.blue;

  //Analyze if the answer is correct
  bool answerChecker(player_answer, correct_answer) {
    questions[idQuestion].question_answered = true;
    number_question++;
    if (player_answer == correct_answer) {
      correct_questions++;

      //Allow to go to the next question
      return true;
    } else {
      return false;
    }
  }

  //Go to next question
  int getQuestion() {
    Random random = new Random();
    int value = random.nextInt(questions.length);
    if (questions[value].question_answered == true) {
      value = getQuestion();
    }
    return value;
  }

  //Open Dialog
  openDialog(bool checker) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
            child: checker ? Text('You' 're right!') : Text('You' 're wrong!')),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
                child: (number_question < questions.length - 1)
                    ? Text('Go to next question')
                    : Text("Check the Final Score"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
                onPressed: () {
                  if (number_question < questions.length - 1) {
                    setState(() {
                      idQuestion = getQuestion();
                      Navigator.pop(context);
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Final_Screen(
                                correct_answers: correct_questions.toString(),
                                length_question: questions.length.toString(),
                              )),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_widht = MediaQuery.of(context).size.width;
    idQuestion = getQuestion();
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Game"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Question Nº " +
                    (number_question + 1).toString() +
                    "/" +
                    questions.length.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            //Question
            Container(
              child: Text(questions[idQuestion].getQuestion.toString(), 
              style: TextStyle(
                fontSize: 30
              ),),
              padding: EdgeInsets.all(40),
             /* decoration: BoxDecoration(
                  border: Border.all(width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(15))),*/
            ),
            // SizedBox(height:100,),

            //First answer
            ElevatedButton(
              child: Text(questions[idQuestion].option_one),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(initialButtonColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
              onPressed: () {
                if (number_question < questions.length - 1) {
                  bool checker;
                  checker = answerChecker(questions[idQuestion].option_one,
                      questions[idQuestion].correct_answer);

                  setState(() {
                    checker
                        ? initialButtonColor = Colors.greenAccent
                        : initialButtonColor = Colors.red;
                  });

                  openDialog(checker);
                  initialButtonColor = Colors.blue;
                }
              },
            ),

            //Second Option
            ElevatedButton(
              child: Text(questions[idQuestion].option_two),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
              onPressed: () {
                if (number_question < questions.length - 1) {
                  bool checker;
                  checker = answerChecker(questions[idQuestion].option_two,
                      questions[idQuestion].correct_answer);
                  setState(() {
                    checker
                        ? initialButtonColor = Colors.greenAccent
                        : initialButtonColor = Colors.red;
                  });
                  openDialog(checker);
                  initialButtonColor = Colors.blue;
                }
              },
            ),
            //Third Option
            ElevatedButton(
              child: Text(questions[idQuestion].option_three),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
              onPressed: () {
                if (number_question < questions.length - 1) {
                  bool checker;
                  checker = answerChecker(questions[idQuestion].option_three,
                      questions[idQuestion].correct_answer);
                  setState(() {
                    checker
                        ? initialButtonColor = Colors.greenAccent
                        : initialButtonColor = Colors.red;
                  });
                  openDialog(checker);
                  initialButtonColor = Colors.blue;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
