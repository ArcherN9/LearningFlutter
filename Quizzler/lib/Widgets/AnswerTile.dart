import 'package:flutter/material.dart';

class AnswerTile extends StatefulWidget {
  // The background color of the response button
  Color intBackgroundColor;

  // The String that is displayed on the Buttons
  List<String> lsAnswerTitle;

  AnswerTile.Builder(this.lsAnswerTitle) {}

  @override
  _AnswerTile createState() {
    return _AnswerTile(lsAnswerTitle);
  }
}

class _AnswerTile extends State<AnswerTile> {
  // A list of possible options for the user to select from
  List<String> lsAnswerTitle;

  _AnswerTile(this.lsAnswerTitle);

  @override
  Widget build(BuildContext context) {
    // A List of widgets that contains AnswerButton widget
    // and populated on the column
    List<Widget> lsAnswerOptions = [];

    lsAnswerTitle.forEach((answerValue) => {
          lsAnswerOptions.add(
              AnswerButton(lsAnswerTitle.indexOf(answerValue), answerValue))
        });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: lsAnswerOptions,
    );
  }
}

class AnswerButton extends StatelessWidget {
  // The string title of the answer option that goes on this particular
  // Answer Button
  String strAnswerTitle = '';

  // This specifies the number at which this answer shows up on the
  // column list
  int optionNumber;

  AnswerButton(this.optionNumber, this.strAnswerTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: FlatButton(
        color: Colors.black45,
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  getAlphabetsInLieuOfNumbers(optionNumber),
                  textAlign: TextAlign.left,
                  style: getResponseTextStyle(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  strAnswerTitle,
                  textAlign: TextAlign.left,
                  style: getResponseTextStyle(),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          print('Button Pressed');
        },
      ),
    );
  }

  /**
    * Creates and returns a Text Style to be applied throughout
    * the answer tiles
    */
  TextStyle getResponseTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  /**
    * Responsible for accepting numeric digits and responds with
    * their numeric position
    */
  String getAlphabetsInLieuOfNumbers(int OptionNumber) {
    switch (OptionNumber) {
      case 0:
        return 'a.';
      case 1:
        return 'b.';
      case 2:
        return 'c.';
      case 3:
        return 'd.';
    }
  }
}
