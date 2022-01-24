import 'package:finance_layout/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:pulsing_button/pulsing_button.dart';
import 'constants/constants.dart';
import 'constants/widgets/custom_text_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
      })),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF050505),
        body: Container(
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _screenSize.height / 16,
              ),
              //!HEADER
              CustomTextWidget(
                  text: "Set your\nFinancial\nGoals",
                  textSize: 56.0,
                  fontWeight: FontWeight.w600,
                  textColour: Color(0xFFA0A0BA)),

              SizedBox(
                height: _screenSize.height / 42,
              ),

              //!HEADER 2
              CustomTextWidget(
                  text:
                      "Our smart finance app will keep your records, stats and track",
                  textSize: 22.0,
                  fontWeight: FontWeight.normal,
                  textColour: Color(0xFFA0A0BA)),

              SizedBox(
                height: _screenSize.height / 42,
              ),

              //!ELEVATED BUTTON
              Container(
                  height: _screenSize.height / 14,
                  width: _screenSize.width / 3,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFD0EAF9),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: containerShadow),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomTextWidget(
                            text: "Go",
                            textSize: 22.0,
                            fontWeight: FontWeight.w600,
                            textColour: Color(0xFF050505)),
                        PulsingButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return WelcomeScreen();
                            }));
                          },
                          animationDuration: Duration(milliseconds: 700),
                          visualDensity: VisualDensity(
                            horizontal: 3.8,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(0xFF050505),
                          ),
                        ),
                      ],
                    ),
                  )),

              SizedBox(
                height: 10.0,
              ),

              //!CIRCLES
              Container(
                width: double.infinity,
                height: _screenSize.height / 2.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: _screenSize.width / 1.15,
                    margin: EdgeInsets.only(left: 90.0),
                    child: Stack(
                      children: <Widget>[
                        //!UPPER CIRCLE
                        CircleAvatar(
                          radius: 130.0,
                          backgroundColor: Color(0XFFC9B6E9),
                          child: CircleAvatar(
                            radius: 80.0,
                            backgroundColor: Color(0xFF050505),
                          ),
                        ),

                        //!LOWER CIRCLE
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 130.0,
                            backgroundColor: Color(0XFFD0EAF9).withOpacity(0.8),
                            child: CircleAvatar(
                              radius: 80.0,
                              backgroundColor: Color(0xFF050505),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
