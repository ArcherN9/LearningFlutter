import 'package:Quizzler/Categories/CategoryList.dart';
import 'package:Quizzler/Network/QuizServices/Models/QuestionModel.dart';
import 'package:Quizzler/Quiz/QuestionsHomeViewModel.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Quiz/QuestionsHome.dart';

const ROUTE_HOME = '/Categories';
const ROUTE_QUESTIONS = '/CategoryQuestions';
const ROUTE_RESULT = '/QuizResult';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// This is the default/ Initial Route that is loaded on to
      /// the application
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) {
          return CategoryList();
        });
        break;

      /// This is the Questionnaire Layout that handles showing
      /// The questions
      case ROUTE_QUESTIONS:
        if (settings.arguments != null &&
            settings.arguments is QuestionListModel) {
          return MaterialPageRoute(builder: (context) {
            return ChangeNotifierProvider(
              create: (context) => QuestionsHomeViewModel(
                  settings.arguments as QuestionListModel),
              child: QuestionsHome(),
            );
          });
        }
        break;
    }
  }
}
