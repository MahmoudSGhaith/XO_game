
import 'package:flutter/material.dart';

class ScreenText extends StatelessWidget {
  String name;
   ScreenText({super.key , required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
    );
  }
}
