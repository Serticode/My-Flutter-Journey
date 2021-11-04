import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:treyon/constants/constants.dart';
import 'package:treyon/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _obscureText = true;
  double _sigmaX = 2; // from 0-10
  double _sigmaY = 2; // from 0-10
  double _opacity = 0.5; // from 0-1.0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          child: Container(
            color: Colors.black.withOpacity(_opacity),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),

                //!FOR LOGO
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.pink.shade600,
                    radius: 65.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/bg5.jpg"),
                      radius: 60.0,
                    ),
                  ),
                ),

                //!GREETING
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  child: Center(
                    child: Text(
                      "Welcome"
                      "\nback !",
                      textAlign: TextAlign.center,
                      style: homePageTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: <Widget>[
                        //!FOR EMAIL
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: textInputDecoration.copyWith(
                            labelText: "E-mail",
                            hintText: "sample@sample.com",
                          ),
                          validator: (value) =>
                              value.isEmpty ? "Enter an Email" : null,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),

                        //!FOR PASSWORD
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: textInputDecoration.copyWith(
                            labelText: "Password",
                            hintText: "Your Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white.withOpacity(0.7),
                                size: 20.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                                print("VIEW PASSWORD PRESSED");
                              },
                            ),
                          ),
                          validator: (value) => value.length < 6
                              ? "Enter a password at least 6 characters long"
                              : null,
                          obscureText: _obscureText,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),

                        //!FORGOT PASSWORD
                        SizedBox(
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  "Forgot Password ?",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  print("FORGOT PASSWORD PRESSED !");
                                },
                              ),
                            ],
                          ),
                        ),

                        //!ELEVATED BUTTON
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            print("ELEVATED BUTTON PRESSED !");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                            );
                          },
                          style: elevatedButtonStyle,
                        ),
                      ],
                    ),
                  ),
                ),

                //!DON'T HAVE AN ACCOUNT ?
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Create One!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          print("CREATE ACCOUNT PRESSED !");
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
