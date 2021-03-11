import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  // The question to be displayed to the user
  String strQuestion;

  QuestionTile.builder(this.strQuestion);

  @override
  State<StatefulWidget> createState() => _QuestionTile(strQuestion);
}

class _QuestionTile extends State<QuestionTile> {
  // The question to be displayed to the user
  String strQuestion;

  _QuestionTile(this.strQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Text(
            this.strQuestion,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Montserrat',
            ),
            softWrap: true,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
