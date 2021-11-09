import 'package:flutter/material.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  _SecondWidgetState createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  final _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //!TODO - CREATE PAGE NAVIGATOR / CURRENT PAGE TAB WITH UNDERLINE
        Expanded(
          //!TODO - ADD IMAGE/VIDEO VIEWER FROM IMAGES / VIDEOS SCREEN
          child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ]),
        ),
      ],
    );
  }
}
