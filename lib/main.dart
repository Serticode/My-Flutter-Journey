import 'package:concentric/customText.dart';
import 'package:concentric/imageLinks.dart';
import 'package:concentric/textData.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConcentricTransitions(),
    );
  }
}

class ConcentricTransitions extends StatefulWidget {
  const ConcentricTransitions({Key? key}) : super(key: key);

  @override
  _ConcentricTransitionsState createState() => _ConcentricTransitionsState();
}

class _ConcentricTransitionsState extends State<ConcentricTransitions> {
  get _theLinks => ImageLinks().links;
  get _theTitles => TitleData().titles;
  get _theSubtitles => SubtitleData().subtitles;
  get _theTitleColours => TitleColours().colours;
  get _theSubtitleColours => SubtitleColours().colours;
  @override
  Widget build(BuildContext context) {
    return ConcentricPageView(
      colors: <Color>[
        Colors.white,
        Colors.red,
        Colors.green,
        Colors.orange,
      ],
      radius: 30.0,
      verticalPosition: 0.88,
      itemCount: 4,
      itemBuilder: (index, value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              _theLinks[index]["images"],
              width: 300,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20
            ),

            CustomText(
              title: _theTitles[index]["titles"],
              subTitle: _theSubtitles[index]["subtitles"],
              theTitleColour: _theTitleColours[index]["colours"],
              theSubtitleColour: _theSubtitleColours[index]["colours"],
              theTitleFontSize: 30,
              theSubTitleFontSize: 24.0,
            )
          ],
        );
      },
    );
  }
}
