import 'package:flutter/material.dart';
import 'package:Quizzler/Widgets/QuestionTile.dart';
import 'package:Quizzler/Widgets/AnswerTile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: QuestionTile(),
          ),
          Expanded(
            flex: 1,
            child: AnswerTile.Builder(Colors.red[500], 'Negative'),
          ),
          Expanded(
            flex: 1,
            child: AnswerTile.Builder(Colors.lightGreen[900], 'Positive'),
          ),
        ],
      ),
    );
  }
}
