import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DividerTile extends StatefulWidget {
  /// The view Model is inherited from the Questions Home widget
  /// and holds all information that is required to manage the
  /// states of Divider tile.
  QuestionsHomeViewModel viewModel;

  /// An integer value that holds the number of questions
  /// this Divider Tile can display or mark
  /// This value is received from upstream
  int intNumberOfQuestions;

  /// Color to set on the divider if the answer was incorrect
  /// final int COLOR_FAIL = 0xFFf44336;
  /// Color to set on the Divider if the answer was correct
  /// final int COLOR_PASS = 0xFF4caf50;
  /// Color to set on the Divider if the question has not been
  /// Attempted yet
  final int COLOR_UNATTEMPTED = 0xFF6d6d6d;

  /// Color to set on the Divider if the question has been attempted
  final int COLOR_ATTEMPTED = 0xFF000000;

  /// A reference to the StatefulWidget's state class
  /// This is used to inform the class to modify the state
  _DividerTile _dividerTile;

  @override
  _DividerTile createState() {
    _dividerTile = _DividerTile();
    return _dividerTile;
  }
}

class _DividerTile extends State<DividerTile> {
  /// A list of colors that is used to describe dividers
  /// colors against question numbers
  List<int> lsColorList;

  @override
  Widget build(BuildContext context) {
    // Retrieve the View Model from the associated Provider
    widget.viewModel = Provider.of<QuestionsHomeViewModel>(
      context,
      listen: true,
    );

    // Update the number of questions in the current quiz
    widget.intNumberOfQuestions =
        widget.viewModel.allQuestions.questions.length;

    // Create a base filled color list of UNATTEMPTED state to begin with
    lsColorList = List<int>.generate(widget.intNumberOfQuestions, (index) {
      if (index < widget.viewModel.getCurrentQuestion) {
        return widget.COLOR_ATTEMPTED;
      } else {
        return widget.COLOR_UNATTEMPTED;
      }
    });

    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getExpandedDividerList(),
      ),
    );
  }

  /// A method that iterates from zero to the number of questions
  /// Available under this quiz and returns A list that contains
  /// Dividers equal to the number of questions
  List<Widget> getExpandedDividerList() {
    // Create a temporary Widget list that is created from
    // empty container with a growable limit
    List<Widget> lsWidgetList = List<Widget>.empty(growable: true);
    // Enumerate from zero to number of questions and apply an
    // individual divider at each position
    lsColorList.forEach((color) {
      lsWidgetList.add(getDivider(color));
    });

    // Return the temporaruy widget list for painting
    return lsWidgetList;
  }

  // Generates an individual divider and returns to the caller
  Widget getDivider(int intColor) {
    return Expanded(
      flex: 1,
      child: Divider(
        thickness: 5,
        color: Color(intColor),
      ),
    );
  }
}
