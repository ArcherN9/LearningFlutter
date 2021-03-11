import 'package:flutter/material.dart';
import 'package:Quizzler/Home/home.dart';

// This is the starting position of the application.
// The main method is auto executed by the system. It serves as the entry point
// To flutter applications
void main() => runApp(QuizzlerApplication());

// This is the starting for the Quizzler Application.
// The base QuizzlerApplication class contains nothing but a Facade through which
// other widets seek screen space
class QuizzlerApplication extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Home(),
        ),
      ),
    );
  }
}
