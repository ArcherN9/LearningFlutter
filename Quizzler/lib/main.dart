import 'package:flutter/material.dart';

import 'package:Quizzler/Network/QuizzlerNetwork.dart';
import 'package:Quizzler/Categories/CategoryList.dart';

import 'package:provider/provider.dart';

import 'Network/CategoryService.dart';

// This is the starting position of the application.
// The main method is auto executed by the system. It serves as the entry point
// To flutter applications
void main() => runApp(QuizzlerApplication());

// This is the starting for the Quizzler Application.
// The base QuizzlerApplication class contains nothing but a Facade through which
// other widets seek screen space
class QuizzlerApplication extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MultiProvider(
            providers: [
              Provider<CategoryService>(
                create: (_) =>
                    CategoryService.create(QuizzlerNetwork().chopperClient),
              ),
            ],
            // dispose: (_, CategoryService categoryService) =>
            //     categoryService.dispose(),
            child: CategoryList(),
          ),
        ),
      ),
    );
  }
}
