import 'package:flutter/material.dart';
import 'package:Quizzler/Widgets/QuestionTile.dart';
import 'package:Quizzler/Widgets/AnswerTile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: TopQuestionSection(),
        ),
        Expanded(
          flex: 1,
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

class BottomAnswerSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomAnswerSection();
}

class _BottomAnswerSection extends State<BottomAnswerSection> {
  // List<String> lsResponseOptions = List.empty(growable: true);
  List<String> lsResponseOptions = [
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
