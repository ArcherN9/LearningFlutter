import 'dart:math';
import 'package:flutter/material.dart';

// The main entry point of the flutter application
void main() {
  // Run the application through a different class that extends StatelessWidget
  // This is to test hot reload.
  runApp(MiCardApplication());
}

// A class that extends StatelessWidget class from Flutter.
// It ensures HotReload functions as intended.
class MiCardApplication extends StatelessWidget {
  // The Build method is an overriden method required for the StatelessWidget
  // to be built.
  @override
  Widget build(BuildContext context) {
    // Return the new custom Widget.
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF607D8B),
          appBar: AppBar(
            title: Text(
              'Dice',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Color(0xFFFFFFFF),
              ), // AppBar text style
            ), // AppBar text
            backgroundColor: Color(0xFF455A64), // Color
          ), // App Bar
          body: DiceMainPage()), // Scaffold
    ); // MaterialApp
  } // Build Method
}

class DiceMainPage extends StatefulWidget {
  @override
  _DiceMainPageState createState() => _DiceMainPageState();
}

class _DiceMainPageState extends State<DiceMainPage> {
  int LeftDiceNumber = 1;
  int RightDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: double.infinity,
            ), // Sized Box to stretch the entire height
            Expanded(
              flex: 3,
              child: FlatButton(
                onPressed: () {
                  generateRandomNumber();
                },
                padding: EdgeInsets.zero,
                child: Image.asset('images/dice$LeftDiceNumber.png'),
              ),
            ), // Expanded widget for first box
            Expanded(
              flex: 1,
              child: Container(),
            ), // Empty expanded container
            Expanded(
              flex: 3,
              child: FlatButton(
                onPressed: () {
                  generateRandomNumber();
                },
                padding: EdgeInsets.zero,
                child: Image.asset('images/dice$RightDiceNumber.png'),
              ),
            ), // Expanded widget for second box
          ], // End of Child array
        ), // Row
      ), // Safe Area
    ); // Padding
  } // Build method

  void generateRandomNumber() {
    setState(() {
      RightDiceNumber = Random().nextInt(6) + 1;
      LeftDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
