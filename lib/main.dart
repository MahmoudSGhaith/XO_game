

import 'package:flutter/material.dart';
import 'package:sec4_xo/screens/players_screen.dart';
import 'package:sec4_xo/screens/xo_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayersScreen.routeName,
      routes: {
        XOScreen.routName : (context) => XOScreen(),
        PlayersScreen.routeName : (context) => PlayersScreen(),

      },
    );
  }
}
