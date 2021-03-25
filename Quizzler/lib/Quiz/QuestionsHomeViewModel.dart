import 'package:Quizzler/Network/QuizServices/Models/QuestionModel.dart';
import 'package:flutter/material.dart';

class QuestionsHomeViewModel extends ChangeNotifier {
  /// The list of answers that is populated against a question
  /// though this exists within QuestionListModel also,
  /// this is used here becase an additional operation of
  /// shuffling and assembling responses is also done.
  List<String> answers = List.empty(growable: true);

  /// The Question List Model that stores all the questions
  /// received from the Open Trivia API for the category selected
  QuestionListModel allQuestions;

  /// A variable to track the user's currently answersed
  /// response from the list of options
  String _selectedAnswer;

  /// A setter for the _selected Answer variable
  /// this is done to attach a change Listener
  /// to assignation
  set userSelectedAnswer(String response) {
    _selectedAnswer = response;
    notifyListeners();
  }

  /// Returns the currently selected answer for the question
  /// that is being displayed
  get getSelectedAnswer {
    return _selectedAnswer;
  }

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

  /// Accesses the responses - wrong options and correct options
  /// shuffles them and returns
  List<String> getQuestionResponses() {
    if (answers == null || answers.isEmpty) {
      // Retrieve all possible options from the View Model
      answers = allQuestions.questions[getCurrentQuestion].responseOptions;
      // Correct answer is provided as a separate key in the JSON model
      // and must be added separately to the answers listview
      answers.add(allQuestions.questions[getCurrentQuestion].correctAnswer);
      // Shuffle up the answer list because the correct answer is
      // always added to the bottom of the list
      answers.shuffle();
    }

    return answers;
  }

  void onResponseSelected(String responseSelected) {
    userSelectedAnswer = responseSelected;

    /// A delayed future is used to transition to the next
    /// question after a certain amount of delay
    /// This lets the ViewModel update the view with the correct
    /// answer for review
    Future.delayed(Duration(milliseconds: 2000), () {
      if (getCurrentQuestion < allQuestions.questions.length - 1) {
        answers = List.empty(growable: true);
        userSelectedAnswer = null;
        setCurrentQuestion = getCurrentQuestion + 1;
      } else {}
    });
  }

  /// Returns the correct response
  /// of the currently displayed question
  String getCurrentQuestionAnswer() =>
      allQuestions.questions[getCurrentQuestion].correctAnswer;

  /// returns the total number of questions available on this quiz
  int getTotalQuestions() => allQuestions.questions.length;
}
