import 'package:flutter/material.dart';
import 'package:Quizzler/Widgets/QuestionTile.dart';
import 'package:Quizzler/Widgets/AnswerTile.dart';
import 'package:Quizzler/Widgets/DividerTile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: DividerTile(
              intNumberOfQuestions: 20,
            )),
        Expanded(
          flex: 5,
          child: TopQuestionSection(),
        ),
        Expanded(
          flex: 5,
          child: BottomAnswerSection(),
        ),
      ],
    );
  }
}

class TopQuestionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: QuestionTile.builder(
          'This is a sample text which keeps on growing like trees all round the year, all through the village but never ceases to exist.',
          'Sample Category'),
    );
  }
}

class BottomAnswerSection extends StatelessWidget {
  // List<String> lsResponseOptions = List.empty(growable: true);
  final List<String> lsResponseOptions = [
    'Accept',
    'Deny',
    'Third Option',
    'Fourth Option'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: AnswerTile.Builder(lsResponseOptions),
    );
  }
}
