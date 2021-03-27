import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color COLOR_PROGRESS = Color(0xFF1B5E20);
const Color COLOR_INVISIBLE = Color(0x00FFFFFF);

class ProgressBar extends StatelessWidget {
  /// The view Model is inherited from the Questions Home widget
  /// and holds all information that is required to manage the
  /// states of Divider tile.
  QuestionsHomeViewModel viewModel;

  // The string title of the answer option that goes on this particular
  // Answer Button
  String answer = '';

  ProgressBar({this.answer});

  @override
  Widget build(BuildContext context) {
    // Retrieve the View Model from the associated Provider
    viewModel = Provider.of<QuestionsHomeViewModel>(
      context,
      listen: false,
    );

    if (answer == viewModel.getCurrentQuestionAnswer()) {
      return AnimatedContainer(
        duration: Duration(
          milliseconds: viewModel.getAnimtedContainerDuration,
        ),
        width: viewModel.getAnimatedContainerSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: COLOR_PROGRESS,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: SizedBox(
          height: 57,
        ),
        onEnd: () {
          if (viewModel.getSelectedAnswer != null) {
            Future.delayed(
                Duration(milliseconds: 100), () => viewModel.nextQuestion());
          }
        },
      );
    } else {
      return Container();
    }
  }
}
