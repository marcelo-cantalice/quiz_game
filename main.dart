import 'package:flutter/material.dart';
import 'package:quiz_game/Game.dart';
import 'package:quiz_game/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Home(),
    routes: {
      '/':(context) => Home(),
      '/game' : (context) => Game(),
      
    },
  ));
}
