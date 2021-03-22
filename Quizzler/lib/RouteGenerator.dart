import 'package:Quizzler/Categories/CategoryList.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/Categories':
        return MaterialPageRoute(builder: (context) {
          return CategoryList();
        });
        break;

      case '/CategoryQuestions':
        if (settings.arguments != null && settings.arguments is int) {
          return MaterialPageRoute(builder: (context) {
            return CategoryList();
          });
        }
        break;
    }
  }
}
