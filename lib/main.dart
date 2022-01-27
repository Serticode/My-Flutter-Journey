import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //fontFamily: "Fira Sans Condensed",
          ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Color mainColour = Colors.indigo.shade900;
  final Color secondaryColour = Colors.white;
  final Color textColour = Colors.black87;
  final String userTag = "Serticode";

  final ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20.0),
      primary: Colors.indigo.shade900.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ));

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _items = [];

  @override
  void didChangeDependencies() async {
    List _tempList = await readJson();
    setState(() {
      _items = _tempList;
    });

    List _convertedImages = [];
    _tempList.forEach((element) {
      _convertedImages.add(Image.memory(base64Decode(element["flag"])));
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: mainColour,
          unselectedItemColor: Colors.grey.shade600,
          onTap: _onItemTapped,
          elevation: 5,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: "Wallets",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Cards"),
            BottomNavigationBarItem(
                icon: Icon(Icons.trending_up_outlined), label: "Transactions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //!NAME BAR
            Expanded(
              flex: 3,
              child: Container(
                color: mainColour,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //!EXTRA SPACING AT THE TOP
                    SizedBox(
                      height: 20,
                    ),
                    //!GREETING AND BAR CODE BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //!GREETING AND NAME
                        Text(
                          "Hello " + "\$" + "$userTag,",
                          style: TextStyle(
                            color: secondaryColour,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //!BARCODE ICON BUTTON
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.qr_code_2_outlined,
                            size: 32,
                            color: secondaryColour,
                          ),
                        )
                      ],
                    ),

                    //!QUESTION LAYER
                    Text(
                      "What would you like to do today?",
                      style: TextStyle(
                        color: secondaryColour,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    //!EXTRA SPACING
                    SizedBox(
                      height: 15,
                    ),

                    //!FUND WALLET AND WITHDRAW BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //!FUND WALLET BUTTON
                        SizedBox(
                          width: _screenSize.width / 2.5,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: _elevatedButtonStyle,
                            child: Text(
                              "FUND WALLET",
                              style: TextStyle(
                                color: secondaryColour,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        //!WITHDRAW BUTTON
                        SizedBox(
                          width: _screenSize.width / 2.5,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: _elevatedButtonStyle,
                            child: Text(
                              "WITHDRAW",
                              style: TextStyle(
                                color: secondaryColour,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //!HEADER BAR
            Container(
              color: secondaryColour,
              height: 60.0,
              padding: EdgeInsets.all(20.0),
              child: Text(
                "WALLETS",
                style: TextStyle(
                  color: mainColour,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //!CURRENCIES BAR
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: _items.length ?? 0,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 3.0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(5.0),
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: mainColour.withOpacity(0.2),
                        child:
                            Image.memory(base64Decode(_items[index]["flag"])),
                      ),
                      title: Text(
                        _items[index]["name"] +
                            " " +
                            _items[index]["currency"]["name"],
                        style: TextStyle(
                          color: textColour,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Text(
                        _items[index]["id"].toString() +
                            " " +
                            _items[index]["currency"]["code"],
                        style: TextStyle(
                          color: textColour,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //! FETCH CONTENT FROM JSON FILE
  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString("lib/constants/countries.json");
    List<dynamic> theJson = await json.decode(response);
    return theJson;
  }
}
