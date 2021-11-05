import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              height: _screenSize.height / 5,
              width: _screenSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/mama_sammy_banner.png")),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(
                      1.0,
                      1.0,
                    ),
                    blurRadius: 30.0,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                ],
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: _screenSize.width / 6.5,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: _screenSize.width / 7.0,
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
