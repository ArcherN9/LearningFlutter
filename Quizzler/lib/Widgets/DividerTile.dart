import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DividerTile extends StatelessWidget {
  /// The view Model is inherited from the Questions Home widget
  /// and holds all information that is required to manage the
  /// states of Divider tile.
  QuestionsHomeViewModel viewModel;

  /// An integer value that holds the number of questions
  /// this Divider Tile can display or mark
  /// This value is received from upstream
  int intNumberOfQuestions;

  /// Color to set on the Divider if the question has not been
  /// Attempted yet
  final Color COLOR_UNATTEMPTED = Color(0xFF6d6d6d);

  /// Color to set on the Divider if the question has been attempted
  final Color COLOR_ATTEMPTED = Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    // Retrieve the View Model from the associated Provider
    viewModel = Provider.of<QuestionsHomeViewModel>(
      context,
      listen: true,
    );

    // Update the number of questions in the current quiz
    intNumberOfQuestions = viewModel.allQuestions.questions.length;

    return Container(
      alignment: Alignment.center,
      child: LinearProgressIndicator(
        minHeight: 5,
        value: viewModel.getCurrentQuestion == 0
            ? 0
            : viewModel.getCurrentQuestion / intNumberOfQuestions,
        backgroundColor: COLOR_UNATTEMPTED,
        valueColor: AlwaysStoppedAnimation<Color>(COLOR_ATTEMPTED),
      ),
    );
  }
}
