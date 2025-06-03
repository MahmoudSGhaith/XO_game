import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClick;

  ScreenButton({
    super.key,
    required this.text,
    required this.onButtonClick,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(3),
        width: double.infinity,
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {
            onButtonClick(index);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }
}
