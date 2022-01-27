import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String theText;
  final double textSize;
  final FontWeight textFontWeight;
  final Color textColour;
  const CustomTextWidget(
      {Key key,
      @required this.theText,
      @required this.textSize,
      @required this.textFontWeight,
      @required this.textColour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.theText,
      style: TextStyle(
        fontSize: this.textSize,
        fontWeight: this.textFontWeight,
        color: this.textColour,
      ),
    );
  }
}
