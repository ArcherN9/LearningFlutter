import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  // The question to be displayed to the user
  String strQuestion;

  // The Domain / category of the question
  String strDomain;

  QuestionTile.builder(this.strQuestion, this.strDomain);

  @override
  State<StatefulWidget> createState() => _QuestionTile(strQuestion, strDomain);
}

class _QuestionTile extends State<QuestionTile> {
  // The question to be displayed to the user
  String strQuestion;

  // The Domain / category of the question
  String strDomain;

  _QuestionTile(this.strQuestion, this.strDomain);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: getQuestionTileMargins(),
                child: Text(
                  this.strQuestion,
                  style: getQuestionTileTextStyle(22),
                  softWrap: true,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: getQuestionTileMargins(),
              child: Text(
                this.strDomain,
                style: getQuestionTileTextStyle(12),
                softWrap: true,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ]);
  }

  // Creates and returns edge insets for the quesion tile with
  // 25 DP margins on the left & right
  EdgeInsets getQuestionTileMargins() {
    return EdgeInsets.only(left: 25, right: 25);
  }

  TextStyle getQuestionTileTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      fontFamily: 'Montserrat',
    );
  }
}
