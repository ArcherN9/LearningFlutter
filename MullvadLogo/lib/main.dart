import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mullvad'),
            backgroundColor: Colors.purple[800],
          ),
          backgroundColor: Colors.blueGrey[200],
          body: Center(
            child: Image(
                image: AssetImage('images/logo.png'), width: 220, height: 220),
          )),
    ),
  );
}
