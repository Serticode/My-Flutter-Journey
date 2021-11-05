import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color theTitleColour;
    final Color theSubtitleColour;
  final double theTitleFontSize;
  final double theSubTitleFontSize;
  CustomText({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.theTitleColour,
    required this.theSubtitleColour,
    required this.theTitleFontSize,
    required this.theSubTitleFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: theTitleFontSize,
                  fontWeight: FontWeight.w700,
                  color: theTitleColour,
                                    decoration: TextDecoration.none

                ),
              ),
              
              Text(
                subTitle,
                                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: theSubTitleFontSize,
                  fontWeight: FontWeight.w400,
                  color: theSubtitleColour,
                  decoration: TextDecoration.none
                ),
              ),
            ]),
      ),
    );
  }
}
