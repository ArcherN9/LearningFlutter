import "dart:async";
import 'package:chopper/chopper.dart';

part "QuizService.chopper.dart";

@ChopperApi(baseUrl: "/api.php")
abstract class QuizService extends ChopperService {
// https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple

  // helper methods that help you instantiate your service
  static QuizService create([ChopperClient client]) => _$QuizService(client);

  @Get()
  Future<Response> getQuiz(
      {@Query('amount') int quizSize,
      @Query('category') int quizCategoryId,
      @Query('difficulty') String difficultyLevel,
      @Query('type') String responseType,
      @Query('token') String token,
      @Query('encode') String encoding});
}
