import 'package:flutter/material.dart';

// The main entry point of the flutter application
void main() {
  // Run the application through a different class that extends StatelessWidget
  // This is to test hot reload.
  runApp(MiCardApplication());
}

// A class that extends StatelessWidget class from Flutter.
// It ensures HotReload functions as intended.
class MiCardApplication extends StatelessWidget {
  // The Build method is an overriden method required for the StatelessWidget
  // to be built.
  @override
  Widget build(BuildContext context) {
    // Return the new custom Widget.
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/DP.jpg'),
              ), // Circle Avatar
              Container(
                height: 20,
              ), // Empty container for height control
              Text(
                'Daksh Srivastava',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ), // Username
              ),
              Container(
                width: double.infinity,
              ) // Invisible container for central positioning on horizontal axis
            ], // End of children array
          ), // Column
        ), // Safe Area
      ), // Scaffold
    ); // MaterialApp
  }
}
