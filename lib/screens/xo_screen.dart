import 'package:flutter/material.dart';
import 'package:sec4_xo/screens/XO_screen_data.dart';

import 'screen_button.dart';
import 'screen_text.dart';

class XOScreen extends StatefulWidget {
  static const String routName = "XO_Game";

  XOScreen({super.key});

  @override
  State<XOScreen> createState() => _XOScreenState();
}

class _XOScreenState extends State<XOScreen> {
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    XoScreenData playersName =
        ModalRoute.of(context)?.settings.arguments as XoScreenData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "XO Game",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                setScore0();
                setState(() {});
              },
              child: Text(
                "Set Score 0",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenText(name: "${playersName.xoPlayer1Name}(x)"),
                    ScreenText(name: "$player1Score"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScreenText(name: "${playersName.xoPlayer2Name}(o)"),
                    ScreenText(name: "$player2Score"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(1),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ScreenButton(
                          text: boardState[0],
                          index: 0,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[1],
                          index: 1,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[2],
                          index: 2,
                          onButtonClick: onButtonClick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ScreenButton(
                          text: boardState[3],
                          index: 3,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[4],
                          index: 4,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[5],
                          index: 5,
                          onButtonClick: onButtonClick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ScreenButton(
                          text: boardState[6],
                          index: 6,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[7],
                          index: 7,
                          onButtonClick: onButtonClick,
                        ),
                        ScreenButton(
                          text: boardState[8],
                          index: 8,
                          onButtonClick: onButtonClick,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "x";
    } else {
      boardState[index] = "o";
    }
    counter++;

    if (checkWinner("x")) {
      player1Score += 1;
      resetBoard();
    } else if (checkWinner("o")) {
      player2Score += 1;
      resetBoard();
    } else if (counter == 9) {
      resetBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    //todo: win from row
    for (int i = 0; i <= 8; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    //todo: win from column
    for (int i = 0; i <= 2; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    //todo: win from diagonals
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void resetBoard() {
    boardState = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
  }

  void setScore0() {
    player1Score = 0;
    player2Score = 0;
  }
}
