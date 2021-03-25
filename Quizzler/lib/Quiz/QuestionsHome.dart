import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:flutter/material.dart';

import 'package:Quizzler/Widgets/QuestionTile.dart';
import 'package:Quizzler/Widgets/AnswerTile.dart';
import 'package:Quizzler/Widgets/DividerTile.dart';
import 'package:provider/provider.dart';

class QuestionsHome extends StatelessWidget {
  QuestionsHomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<QuestionsHomeViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: DividerTile(),
            ),
            Expanded(
              flex: 5,
              child: QuestionTile(),
            ),
            Expanded(
              flex: 5,
              child: AnswersTile(),
            ),
          ],
        ),
      ),
    );
  }
}
