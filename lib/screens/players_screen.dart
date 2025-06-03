import 'package:flutter/material.dart';
import 'package:sec4_xo/screens/XO_screen_data.dart';
import 'package:sec4_xo/screens/xo_screen.dart';

class PlayersScreen extends StatelessWidget {
  static const String routeName = "PlayersScreen";
  static String player1Name = "";
  static String player2Name = "";

  PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Players Screen",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: TextField(
                decoration: InputDecoration(labelText: "enter player 1 name"),
                onChanged: (text) {
                  player1Name = text;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: TextField(
                decoration: InputDecoration(labelText: "enter player 2 name"),
                onChanged: (text) {
                  player2Name = text;
                },
              ),
            ),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, XOScreen.routName , arguments:
                    XoScreenData(xoPlayer1Name: player1Name, xoPlayer2Name: player2Name)
                );
              },
              child: Text(
                "يلا بينا نلعب",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
