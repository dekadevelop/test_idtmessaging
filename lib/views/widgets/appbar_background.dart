import 'package:flutter/material.dart';

class AppBarBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.blueGrey, Colors.blue]),
      ),
    );
  }
}
