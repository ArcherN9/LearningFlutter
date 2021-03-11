import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'This is a sample text which keeps on growing like trees all round the year, all through the village but never ceases to exist.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'UbuntuMono',
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
