import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:Quizzler/RouteGenerator.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

const Color COLOR_INCORRECT = Color(0xFFB71C1C);
const Color COLOR_CORRECT = Color(0xFF1B5E20);
const Color COLOR_UNATTEMPTED = Colors.black45;

class AnswersTile extends StatelessWidget {
  /// The view Model is inherited from the Questions Home widget
  /// and holds all information that is required to manage the
  /// states of Divider tile.
  QuestionsHomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // Retrieve the View Model from the associated Provider
    viewModel = Provider.of<QuestionsHomeViewModel>(
      context,
      listen: true,
    );

    /// When the current question number exceeds the number
    /// of questions available on the quiz,
    /// This means the user has been through the entire quiz
    /// Here, we display the score screen
    // Navigator.of(context).pushNamed(ROUTE_RESULT);

    // A List of widgets that contains AnswerButton widget
    // and populated on the column
    List<Widget> answerWidgets = [];

    // A list of possible options for the user to select from
    List<String> answers = viewModel.getQuestionResponses();
    answers.forEach((answerValue) => {
          answerWidgets.add(
            AnswerButton(
              answers.indexOf(answerValue),
              answerValue,
            ),
          )
        });

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: answerWidgets,
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  /// The view Model is inherited from the Questions Home widget
  /// and holds all information that is required to manage the
  /// states of Divider tile.
  QuestionsHomeViewModel viewModel;

  // The string title of the answer option that goes on this particular
  // Answer Button
  String answer = '';

  // This specifies the number at which this answer shows up on the
  // column list
  int optionNumber;

  AnswerButton(this.optionNumber, this.answer);

  @override
  Widget build(BuildContext context) {
    // Retrieve the View Model from the associated Provider
    viewModel = Provider.of<QuestionsHomeViewModel>(
      context,
      listen: true,
    );

    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Card(
        elevation: 4.0,
        shape: getRoundedRectangle(radius: 15),
        color: getAnswerTileColor(answer),
        child: FlatButton(
          shape: getRoundedRectangle(radius: 15),
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
                    answer,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getResponseTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            if (viewModel.getSelectedAnswer == null) {
              viewModel.onResponseSelected(answer);
            }
          },
        ),
      ),
    );
  }

  Color getAnswerTileColor(String answer) {
    if (viewModel.getSelectedAnswer == null ||
        (viewModel.getSelectedAnswer != answer &&
            answer != viewModel.getCurrentQuestionAnswer())) {
      return COLOR_UNATTEMPTED;
    } else if (answer == viewModel.getCurrentQuestionAnswer()) {
      return COLOR_CORRECT;
    } else {
      return COLOR_INCORRECT;
    }
  }

  ///
  /// Creates and returns a Text Style to be applied throughout
  /// the answer tiles
  ///
  TextStyle getResponseTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  ///
  /// Responsible for accepting numeric digits and responds with
  /// their numeric position
  ///
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
      case 4:
        return 'e.';
      case 5:
        return 'f.';
    }
  }

  /// Generates a Rounded Rectangle with a defined radius
  /// and returns to the caller
  RoundedRectangleBorder getRoundedRectangle({double radius}) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}
