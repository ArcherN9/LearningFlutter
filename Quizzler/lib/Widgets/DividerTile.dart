import 'package:flutter/material.dart';

class DividerTile extends StatefulWidget {
  // An integer value that holds the number of questions
  // this Divider Tile can display or mark
  // This value is received from upstream
  final int intNumberOfQuestions;

  // Color to set on the divider if the answer was incorrect
  // final int COLOR_FAIL = 0xFFf44336;
  // Color to set on the Divider if the answer was correct
  // final int COLOR_PASS = 0xFF4caf50;
  // Color to set on the Divider if the question has not been
  // Attempted yet
  final int COLOR_UNATTEMPTED = 0xFF6d6d6d;
  // Color to set on the Divider if the question has been attempted
  final int COLOR_ATTEMPTED = 0xFF000000;

  // Default constructor accepts an integer
  // The number of questions that this DividerTile
  // will depict
  DividerTile({this.intNumberOfQuestions});

  // A reference to the StatefulWidget's state class
  // This is used to inform the class to modify the state
  _DividerTile _dividerTile;

  @override
  _DividerTile createState() {
    _dividerTile = _DividerTile();
    return _dividerTile;
  }

  // A method exposed to external widgets. This receives a question
  // numnber as an argument and updates the corresponding question
  // number on the color list as ATTEMPTED.
  // Additionally, the state is updated to rebuild the widget
  void updateQuestionTracker(int intQuestionNumber) {
    _dividerTile.setState(() {
      _dividerTile.lsColorList[intQuestionNumber] = COLOR_ATTEMPTED;
    });
  }
}

class _DividerTile extends State<DividerTile> {
  // A list of colors that is used to describe dividers
  // colors against question numbers
  List<int> lsColorList;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    lsColorList =
        List<int>.filled(widget.intNumberOfQuestions, widget.COLOR_UNATTEMPTED);
  }

  void updateQuestionTracker(int intQuestionNumber) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: getExpandedDividerList(),
      ),
    );
  }

  // A method that iterates from zero to the number of questions
  // Available under this quiz and returns A list that contains
  // Dividers equal to the number of questions
  List<Widget> getExpandedDividerList() {
    // Create a temporary Widget list that is created from
    // empty container with a fixed limit
    List<Widget> lsWidgetList = List<Widget>.empty(growable: true);
    // Enumerate from zero to number of questions and apply an
    // individual divider at each position
    for (var intCounter = 0;
        intCounter < widget.intNumberOfQuestions;
        intCounter++) {
      lsWidgetList.add(getDivider(lsColorList[intCounter]));
    }

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
