import 'package:animated_text_kit/animated_text_kit.dart';
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
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        fontSize: theTitleFontSize,
                        fontWeight: FontWeight.w900,
                        color: theTitleColour,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    subTitle,
                    cursor: " | ",
                    curve: Curves.easeOutSine,
                    speed: const Duration(milliseconds: 200),
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        fontSize: theSubTitleFontSize,
                        fontWeight: FontWeight.w500,
                        color: theSubtitleColour,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
