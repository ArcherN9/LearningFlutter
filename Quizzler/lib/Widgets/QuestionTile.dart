import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionTile extends StatelessWidget {
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
                  viewModel.allQuestions.questions[viewModel.getCurrentQuestion]
                      .question,
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
                viewModel.allQuestions.questions[viewModel.getCurrentQuestion]
                    .categoryName,
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

  /// Creates a text style to apply with a dark hue of black and
  /// Montesserat font face and returns it
  TextStyle getQuestionTileTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      fontFamily: 'Montserrat',
    );
  }
}
