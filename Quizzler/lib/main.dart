import 'package:Quizzler/RouteGenerator.dart';
import 'package:flutter/material.dart';

import 'package:Quizzler/Network/QuizzlerNetwork.dart';

import 'package:provider/provider.dart';

import 'Network/CategoryService.dart';

// This is the starting position of the application.
// The main method is auto executed by the system. It serves as the entry point
// To flutter applications
void main() => runApp(ProviderWidget());

/// This is the starting for the Quizzler Application.
/// The base ProviderWidget class contains nothing but a Provider for child
/// for child widgets
class ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Provider(
      create: (_) => CategoryService.create(QuizzlerNetwork().chopperClient),
      dispose: (_, CategoryService categoryService) =>
          categoryService.dispose(),
      child: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Categories',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
