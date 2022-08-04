import 'package:flutter/material.dart';
import 'package:quiz_game/Home.dart';

class Final_Screen extends StatefulWidget {
  String correct_answers = "";
  String length_question = "";
  Final_Screen(
      {Key? key, required this.correct_answers, required this.length_question})
      : super(key: key);

  @override
  State<Final_Screen> createState() => _Final_ScreenState();
}

class _Final_ScreenState extends State<Final_Screen> {
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
            Text("GOOD JOB!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text(
              "You're final score is " +
                  widget.correct_answers +
                  "/" +
                  widget.length_question,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
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
