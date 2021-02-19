import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

/// A color palette for the xylophone bar keys
/// which a user interacts with to create music
/// This is a pre defined list of colors
List<int> colorPalette = [
  0xFFB71C1C, // Red
  0xFF880E4F, // Crimson
  0xFF4A148C, // Purple
  0xFF311B92, // Deep Purple
  0xFF1A237E, // Indigo
  0xFF0D47A1, // Blue
  0xFF004D40, // Teal
];

// Create an instance of the AudioCache Class - Used to play music
// from local Asset sources
final cache = AudioCache();

void main() {
  runApp(XylophoneApp());
}

/// The main Xylophone application stateless widget
/// that serves as the root of the Xylophone application
/// It initializes the App bar and the body
class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          backgroundColor: Color(0xFF00796B),
        ),
        body: Scaffold(
          backgroundColor: Color(0xFFB2DFDB),
          body: BarState(),
        ),
      ),
    );
  }
}

/// A stateful BarState class that initializes the rest of the xylophone app
/// : The number of bars, the colors they should contain and the sound to play
/// when a bar key is tapped on
class BarState extends StatefulWidget {
  @override
  _BarState createState() {
    return _BarState();
  }
}

class _BarState extends State<BarState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: getKeys(),
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  /// The getKeys method generates a List of the size of the color palette
  /// defined at the root of the file and recurrently creates individual Colored
  /// bars to return as elements of a column
  List<Widget> getKeys() {
    var arrayColumnKeys = new List<Widget>(colorPalette.length);
    for (int intCounter = 0;
        intCounter < arrayColumnKeys.length;
        intCounter++) {
      arrayColumnKeys[intCounter] = ColoredBar.defineSize(intCounter + 1);
    }
    return arrayColumnKeys;
  }
}

/// The coloredBar is a stateless widget that creates the actual bar
/// shown on the xylophone application.
class ColoredBar extends StatelessWidget {
  /// The object ID is an integer that defines which Wave file to play
  /// against which button
  int ObjectId = 0;

  ColoredBar() {
    // Stub Constructor
  }

  /// Secondary Named constructor for accepting the buildObject ID
  ColoredBar.defineSize(int objectId) {
    this.ObjectId = objectId;
    cache.load('note$ObjectId.wav');
  }

  /// A method that utilises a Random number generator constrained by
  /// the length of the color palette. The random number is used to lookup
  /// a color against the palette defined up above
  int getRandomColor() {
    // Use the random number generator and pick a random color
    int randomColor = colorPalette[Random().nextInt(colorPalette.length)];
    // Remove the random color from the palette. This is used such that
    // No key bar utilises the same color from the palette.
    colorPalette.remove(randomColor);
    // Return the random color
    return randomColor;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: FlatButton(
          onPressed: () {
            // The Bar Key number is accepted in the form of an ObjectID
            // from the constructor and used to pick a sound file from the asset
            try {
              cache.play('note$ObjectId.wav', volume: 0.5);
            } on Exception {
              cache.clearCache();
            }
          },
          child: Container(
            // width: double.infinity,
            color: Color(getRandomColor()),
          ),
        ),
      ),
    );
  }
}
