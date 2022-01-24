import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColour;
  const CustomTextWidget(
      {Key key,
      @required this.text,
      @required this.textSize,
      @required this.fontWeight,
      @required this.textColour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: this.textSize,
        fontWeight: this.fontWeight,
        color: this.textColour,
      ),
    );
  }
}
