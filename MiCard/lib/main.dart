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
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/DP-2.JPG'),
              ), // Circle Avatar
              Container(
                height: 20,
              ), // Empty container for height control
              Text(
                'Archer N9',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ), // Username
              ),
              Text(
                'Android Developer via Kotlin & Flutter',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.blueGrey.shade200,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold), // Description
              ), // Description Text
              SizedBox(
                height: 20,
                child: Divider(
                  indent: 35,
                  endIndent: 35,
                  color: Colors.blueGrey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ), // Sized box between Description and phone number
              Card(
                margin: EdgeInsets.only(left: 27, right: 27),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    size: 25,
                    color: Colors.blueGrey[900],
                  ), // Phone icon
                  title: Text(
                    '+44 741 831 0977',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.blueGrey.shade900,
                    ),
                  ), // Phone number text
                ),
              ), // Phone number container
              SizedBox(
                height: 5,
              ), // Sized box between Description and phone number
              Card(
                margin: EdgeInsets.only(left: 27, right: 27),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 25,
                    color: Colors.blueGrey[900],
                  ), // Phone icon
                  title: Text(
                    'divya.s90@yahoo.com',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.blueGrey.shade900,
                    ),
                  ), // Phone number text
                ),
              ), // Email container
              SizedBox(
                height: 5,
              ), // Sized box between Description and phone number
              Card(
                margin: EdgeInsets.only(left: 27, right: 27),
                child: ListTile(
                  leading: Icon(
                    Icons.web,
                    size: 25,
                    color: Colors.blueGrey[900],
                  ), // Phone icon
                  title: Text(
                    'https://archern9.github.io/',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.blueGrey.shade900,
                    ), // Website Text Style
                  ), // Website text
                ), // Website List Title
              ), // Website Card
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
