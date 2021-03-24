import 'package:Quizzler/Network/QuizServices/Models/QuestionModel.dart';
import 'package:flutter/material.dart';

class QuestionsHomeViewModel extends ChangeNotifier {
  /// The Question List Model that stores all the questions
  /// received from the Open Trivia API for the category selected
  QuestionListModel allQuestions;

  /// Tracks which question is currently being displayed to the user
  int _currentQuestion = 0;

  /// A getter for the Current question
  int get getCurrentQuestion {
    return _currentQuestion;
  }

  /// Accepts an index/Question number as a param and updates
  /// the current question that is being displayed to the user
  set setCurrentQuestion(int index) {
    _currentQuestion = index;
    notifyListeners();
  }

  /// The default constructor that accepts the question list
  QuestionsHomeViewModel(this.allQuestions);
}
