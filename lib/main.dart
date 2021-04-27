import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<String> note = [
    "Do",
    "Re",
    "Mi",
    "Fa",
    "So",
    "La",
    "Ti",
  ];

  final elevatedButtonTextStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
    color: Color(0xFF002147),
  );

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        child: Text(
          note[soundNumber - 1],
          style: elevatedButtonTextStyle,
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
