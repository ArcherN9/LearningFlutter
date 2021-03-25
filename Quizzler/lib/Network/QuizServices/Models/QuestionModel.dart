import 'dart:convert';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'QuestionModel.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionListModel {
  @JsonKey(name: 'response_code')
  int responseCode;

  /// The root level List Model contains only a list
  ///  that populates a model of type CategoryModel
  @JsonKey(name: 'results')
  List<QuestionModel> questions;

  // The default condstructor
  QuestionListModel({this.questions});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CategorylistModel
  factory QuestionListModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionListModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionListModelToJson(this);
}

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: 'category')
  String categoryName;

  @JsonKey(name: 'type')
  String responseType;

  @JsonKey(name: 'difficulty')
  String difficultyLevel;

  @JsonKey(name: 'question')
  String question;

  @JsonKey(name: 'correct_answer')
  String correctAnswer;

  @JsonKey(name: 'incorrect_answers')
  List<String> responseOptions;

  QuestionModel({
    String categoryName,
    String responseType,
    String difficultyLevel,
    String question,
    String correctAnswer,
    List<String> responseOptions,
  }) {
    this.categoryName = utf8.decode(base64.decode(categoryName));
    this.responseType = utf8.decode(base64.decode(responseType));
    this.difficultyLevel = utf8.decode(base64.decode(difficultyLevel));
    this.question = utf8.decode(base64.decode(question));
    this.correctAnswer = utf8.decode(base64.decode(correctAnswer));
    this.responseOptions = List<String>.empty(growable: true);
    responseOptions.forEach((value) {
      this.responseOptions.add(utf8.decode(base64.decode(value)));
    });
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
