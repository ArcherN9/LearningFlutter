// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuizService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$QuizService extends QuizService {
  _$QuizService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = QuizService;

  @override
  Future<Response<dynamic>> getQuiz(
      {int quizSize,
      int quizCategoryId,
      String difficultyLevel,
      String responseType}) {
    final $url = '/api.php';
    final $params = <String, dynamic>{
      'amount': quizSize,
      'category': quizCategoryId,
      'difficulty': difficultyLevel,
      'type': responseType
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
