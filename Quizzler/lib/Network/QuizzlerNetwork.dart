import 'package:Quizzler/Network/CategoryService.dart';
import 'package:Quizzler/Network/QuizServices/QuizService.dart';
import 'package:chopper/chopper.dart';
import 'package:Quizzler/Network/TokenService.dart';

class QuizzlerNetwork {
  // QuizzlerNetwork class is a singleton class
  static QuizzlerNetwork _instance;

  // The Quizzler OpenTrivia API Host
  static String OPENTRIVIA_HOST = 'https://opentdb.com';

  // The chopperClient that is manufactured by the QuizzlerNetwork
  // service
  ChopperClient chopperClient;

  // We use an internal constructor to create an instance of this
  // class by invoking it through the factory constructor
  QuizzlerNetwork._internal() {
    // instantiate the Chopper Client
    chopperClient = ChopperClient(
      baseUrl: OPENTRIVIA_HOST,
      services: [
        // inject the generated service
        TokenService.create(),
        CategoryService.create(),
        QuizService.create(),
      ],
      converter: JsonConverter(),
    );
  }

  // The factory constructor verifies if an instance exists. If
  // it does, it returns the _instance
  factory QuizzlerNetwork() {
    if (_instance == null) {
      _instance = QuizzlerNetwork._internal();
    }

    return _instance;
  }
}
