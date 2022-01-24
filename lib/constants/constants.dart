import 'package:flutter/material.dart';

List<BoxShadow> containerShadow = [
  BoxShadow(
    color: Color(0xFFA0A0BA).withOpacity(0.4),
    offset: const Offset(
      1.0,
      1.0,
    ),
    blurRadius: 90.0,
    spreadRadius: 3.0,
  ),
];

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xFFD0EAF9),
    padding: EdgeInsets.all(10.0),
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ));
