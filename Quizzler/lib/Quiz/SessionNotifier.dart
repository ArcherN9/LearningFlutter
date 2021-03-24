import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:Quizzler/Network/QuizzlerNetwork.dart';
import 'package:Quizzler/Network/TokenService.dart';

class SessionNotifier extends ChangeNotifier {
  String token;

  // The get SessionToken notifier requests OpenTrivia APi
  // responsible for generating a new Session token
  // This is useful for ensuring OpenTrivia API does not respond
  // with redundant questions.
  Future<Response> getSessionToken() async {
    // instantiate the Chopper Client
    var sessionApiService =
        TokenService.create(QuizzlerNetwork().chopperClient);

    var session = await sessionApiService.getSessionToken('request');
    if (session.isSuccessful) {
      print(session.body);
      token = session.body;
      notifyListeners();
    }
  }
}
