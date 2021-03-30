import 'package:shared_preferences/shared_preferences.dart';

class FlutterPreferences {
  final String PREF_TOKEN = 'PREF_TOKEN';

  static FlutterPreferences _instance;

  factory FlutterPreferences() {
    if (_instance == null) {
      _instance = FlutterPreferences._internal();
    }

    return _instance;
  }

  FlutterPreferences._internal();

  void storeSessionToken(String token) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PREF_TOKEN, token);
  }

  Future<String> getSessionToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(PREF_TOKEN);
  }
}
