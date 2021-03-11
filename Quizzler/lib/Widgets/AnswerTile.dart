import 'package:flutter/material.dart';

class AnswerTile extends StatefulWidget {
  // The background color of the response button
  Color intBackgroundColor;

  // The String that is displayed on the Buttons
  String strAnswerTitle;

  AnswerTile.Builder(this.intBackgroundColor, this.strAnswerTitle) {}

  @override
  _AnswerTile createState() => _AnswerTile(intBackgroundColor, strAnswerTitle);
}

class _AnswerTile extends State<AnswerTile> {
  // The background color of the response button
  Color intBackgroundColor;

  // The String that is displayed on the Buttons
  String strAnswerTitle;

  _AnswerTile(this.intBackgroundColor, this.strAnswerTitle);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: intBackgroundColor,
      child: Center(
        child: Text(
          strAnswerTitle,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'UbuntuMono',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        print('Button Pressed');
      },
    );
  }
}
