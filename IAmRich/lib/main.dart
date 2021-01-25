import 'package:flutter/material.dart';

// The main method is the main entry point of any Flutter application.
// We could use this as a scoped function or expression.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // The top section of the Scaffold that carries the AppBar
        // This is the section which carries the title of the application
        appBar: AppBar(
          title: Text("I Am Rich"),
          backgroundColor: Colors.blueGrey[900],
        ), // App Bar

        // The background color property of the scaffold applies the color to
        // the scaffold in its entirety.
        backgroundColor: Colors.blueGrey[700],

        // The main content of the IAmRich application is a simple image
        // taken from the course resources and displayed here.
        // You should be able to check the image file in the resources.
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
            width: 220,
            height: 220,
          ),
        ), // Center
      ), // Scaffold
    ),
  );
}
