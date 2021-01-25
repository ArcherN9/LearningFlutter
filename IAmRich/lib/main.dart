import 'package:flutter/material.dart';

// The main method is the main entry point of any Flutter application.
// We could use this as a scoped function or expression.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Scaffold(
          backgroundColor: Colors.blueGrey[200],
          body: Center(
            child: Image(image: AssetImage('images/diamond.png')),
          ),
        ),
      ),
    ),
  );
}
