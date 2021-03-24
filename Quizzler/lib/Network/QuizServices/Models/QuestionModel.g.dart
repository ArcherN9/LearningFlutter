// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListModel _$QuestionListModelFromJson(Map<String, dynamic> json) {
  return QuestionListModel(
    questions: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..responseCode = json['response_code'] as int;
}

Map<String, dynamic> _$QuestionListModelToJson(QuestionListModel instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return QuestionModel(
    categoryName: json['category'] as String,
    responseType: json['type'] as String,
    difficultyLevel: json['difficulty'] as String,
    question: json['question'] as String,
    correctAnswer: json['correct_answer'] as String,
    responseOptions:
        (json['incorrect_answers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'category': instance.categoryName,
      'type': instance.responseType,
      'difficulty': instance.difficultyLevel,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.responseOptions,
    };
