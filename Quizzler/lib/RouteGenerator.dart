import 'package:Quizzler/Categories/CategoryList.dart';
import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:flutter/material.dart';

const ROUTE_HOME = '/Categories';
const ROUTE_QUESTIONS = '/CategoryQuestions';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// This is the default/ Initial Route that is loaded on to
      /// the application
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) {
          return CategoryList();
        });
        break;

      /// This is the Questionnaire Layout that handles showing
      /// The questions
      case ROUTE_QUESTIONS:
        if (settings.arguments != null && settings.arguments is CategoryModel) {
          return MaterialPageRoute(builder: (_) {
            return CategoryList();
          });
        }
        break;
    }
  }
}
