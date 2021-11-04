import 'package:flutter/material.dart';
import 'package:treyon/containerDetails.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/homebg.jfif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),

            //!TOP BAR
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage("images/user.jpg"),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () => print("MENU ICON PRESSED !!"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            //!BALANCE
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Total  Balance",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "\$12,698",
                      style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //!CONTAINER FOR STATISTICS.
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: containerDetails(buildContext: context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
