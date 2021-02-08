import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(BallPage());
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF512DA8),
            title: Text('Ask me Anything'),
          ),
          body: MagicEightBall()),
    );
  }
}

class MagicEightBall extends StatefulWidget {
  @override
  _MagicEightBallState createState() => _MagicEightBallState();
}

class _MagicEightBallState extends State<MagicEightBall> {
  int RandomNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF673AB7),
      body: Center(
        child: FlatButton(
          onPressed: () => {
            setState(() {
              RandomNumber = getRandomNumber();
            })
          },
          child: Image.asset(
            'images/ball$RandomNumber.png',
            width: 250,
          ),
        ),
      ),
    );
  }

  int getRandomNumber() {
    return new Random().nextInt(5) + 1;
  }
}
