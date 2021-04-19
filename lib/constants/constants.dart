import 'package:flutter/material.dart';

//!STYLES SECTION
//TEXT STYLES
var scaffoldMessengerTextStyle =
    TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white);

var homePageTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w500,
);

// FORM FIELDS / TEXT INPUT DECORATIONS
var textInputDecoration = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  labelStyle: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.8),
  ),
  hintStyle: TextStyle(
    fontSize: 14.0,
    color: Colors.white.withOpacity(0.6),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.5,
    ),
  ),
  focusColor: Colors.white,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      color: Colors.white,
    ),
  ),
);

//ELEVATED BUTTONS SECTION
var elevatedButtonStyle = ElevatedButton.styleFrom(
  elevation: 10.0,
  primary: Colors.pink.shade600,
  padding: EdgeInsets.all(20.0),
  minimumSize: Size.fromHeight(50.0),
  shadowColor: Colors.black.withOpacity(0.7),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);

var elevatedButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);