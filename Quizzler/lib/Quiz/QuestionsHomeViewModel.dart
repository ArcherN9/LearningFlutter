import 'package:Quizzler/Network/QuizServices/Models/QuestionModel.dart';
import 'package:flutter/material.dart';

const int ANIMATION_DURATION = 3000;

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

  /// Tracks which question is currently being displayed to the user
  int _currentQuestion = 0;

  /// The animated container size is initialized as zero
  /// and remains zero until the user selects an option on the quiz.
  /// When the user taps a response, the container size
  /// is increased to 500 (any random value bigger than actual box
  /// size) and when the container rebuilds, a progress bar animation
  /// is displayed
  double _animatedContainerSize = 0;

  int _animatedContainerDuration = ANIMATION_DURATION;

  /// The default constructor that accepts the question list
  QuestionsHomeViewModel(this.allQuestions);

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

  /// Returns the container size to the caller. This is done
  /// because the container size is actively toggled between a max
  /// width and 0
  double get getAnimatedContainerSize {
    return _animatedContainerSize;
  }

  int get getAnimtedContainerDuration {
    return _animatedContainerDuration;
  }

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

  void onResponseSelected(String responseSelected) async {
    _animatedContainerDuration = ANIMATION_DURATION;
    _animatedContainerSize = 340;
    userSelectedAnswer = responseSelected;
  }

  void nextQuestion() async {
    // A delayed future is used to transition to the next
    // question after a certain amount of delay
    // This lets the ViewModel update the view with the correct
    // answer for review
    // Future.delayed(Duration(milliseconds: 3000), () {
    if (getCurrentQuestion < allQuestions.questions.length - 1) {
      answers = List.empty(growable: true);
      _animatedContainerDuration = 0;
      _animatedContainerSize = 0;
      _selectedAnswer = null;
      setCurrentQuestion = getCurrentQuestion + 1;
    }
    // });
  }

  /// Returns the correct response
  /// of the currently displayed question
  String getCurrentQuestionAnswer() =>
      allQuestions.questions[getCurrentQuestion].correctAnswer;

  /// returns the total number of questions available on this quiz
  int getTotalQuestions() => allQuestions.questions.length;
}
