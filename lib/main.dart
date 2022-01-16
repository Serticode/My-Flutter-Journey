import 'package:flutter/material.dart';
import 'package:treyon/screens/welcome_screen.dart';

import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade900,
        accentColor: Colors.pink.shade700,
        fontFamily: "Fira Sans Condensed",
      ),
      home: WelcomeScreen(),
    );
  }
}
