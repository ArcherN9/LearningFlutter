import 'package:Quizzler/Network/TokenServices/Models/TokenModel.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Quizzler/Network/TokenServices/TokenService.dart';

class TokenServiceViewModel extends ChangeNotifier {
  TokenModel _tokenModel;

  String get getToken {
    return _tokenModel.token;
  }

  set setTokenModel(TokenModel model) {
    this._tokenModel = model;
    notifyListeners();
  }

  /// Attempts to fetch a new token from the OpenTrivia API.
  /// and silently updates it in the Token Model
  Future<Response> updateQuizToken(BuildContext context) async {
    Future<Response> response =
        Provider.of<TokenService>(context).getSessionToken('request');

    response.then((response) {
      if (response.isSuccessful &&
          response.body != null &&
          response.statusCode == 200) {
        TokenModel tokenModel = TokenModel.fromJson(response.body);
        setTokenModel = tokenModel;
      }
    });

    return response;
  }
}
