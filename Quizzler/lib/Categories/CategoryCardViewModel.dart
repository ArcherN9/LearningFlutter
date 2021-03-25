import 'dart:math';

import 'package:Quizzler/Categories/CategoryList.dart';
import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:Quizzler/Network/QuizServices/Models/QuestionModel.dart';
import 'package:Quizzler/Network/QuizServices/QuizService.dart';
import 'package:Quizzler/Network/TokenServices/TokenViewModel.dart';
import 'package:chopper/chopper.dart';

import 'package:flutter/material.dart';
import 'package:pixabay_picker/model/pixabay_media.dart';
import 'package:pixabay_picker/pixabay_picker.dart';
import 'package:provider/provider.dart';

class CategoryCardViewModel {
  // The Card
  CategoryModel categoryModel;
  QuizService quizService;
  PixabayPicker pixabayPicker;
  TokenViewModel tokenViewModel;

  CategoryCardViewModel(
    this.categoryModel,
    BuildContext context,
  ) {
    pixabayPicker = Provider.of<PixabayPicker>(context);
    quizService = Provider.of<QuizService>(context);
    tokenViewModel = Provider.of<TokenViewModel>(context);
  }

  Future<QuestionListModel> onCardPressed() async {
    Response response = await quizService.getQuiz(
      quizSize: 10,
      quizCategoryId: this.categoryModel.categoryId,
      difficultyLevel: 'easy',
      responseType: 'multiple',
      token: tokenViewModel.getToken,
      encoding: 'base64',
    );
    return QuestionListModel.fromJson(response.body);
  }

  void dispose() {
    pixabayPicker = null;
    quizService.dispose();
    categoryModel = null;
  }

  /// Creates the Category Quiz information from the Category Model
  /// provided and returns to the caller
  String CategoryIdToQuizId() => 'Quiz ${categoryModel.categoryId}';

  /// Creates the category title from the category model
  /// provided and returns to the caller
  String getCategoryName() => '${categoryModel.categoryName}';

  /// Accepts the upper limit of a random number to be generated
  /// and generates a number between 0 - upper limit
  int getRandomNumber({int upperLimit}) {
    return Random().nextInt(upperLimit);
  }

  /// A method that utilises a Random number generator constrained by
  /// the length of the color palette. The random number is used to lookup
  /// a color against the palette defined up above
  int getRandomColor() {
    // Use the random number generator and pick a random color
    int randomColor = colorPalette[Random().nextInt(colorPalette.length)];
    // Return the random color
    return randomColor;
  }

  Future<PixabayResponse> retrieveCategoryImage() {
    String queryString = categoryModel.categoryName.contains(':')
        ? categoryModel.categoryName.split(':')[1].trim()
        : categoryModel.categoryName;

    return pixabayPicker.api.requestImagesWithKeyword(
      keyword: queryString,
      resultsPerPage: 35,
    );
  }
}
