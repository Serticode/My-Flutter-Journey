import 'package:finance_layout/constants/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants/widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  final Color _selectedBottomBarColor = Color(0xFFD0EAF9);
  final Color _unselectedBottomBarColor = Color(0xFFA0A0BA);
  final List<String> itemTitles = ["Spotify", "Grocery", "Food"];
  final List<String> itemPrices = ["-\$15.00", "-\$150.00", "-\$16.35"];

  final List leadingIcons = [
    FontAwesomeIcons.spotify,
    FontAwesomeIcons.shoppingCart,
    FontAwesomeIcons.pizzaSlice,
  ];

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //!TOP ROW
          TopBar(
            pageTitle: false,
          ),

          //!FINANCE UPDATES CARDS
          Container(
            height: _screenSize.height / 3,
            padding: EdgeInsets.all(10.0),
            child: ListView.separated(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: 20.0,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: _screenSize.width / 1.8,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? _selectedBottomBarColor
                          : _unselectedBottomBarColor,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: _screenSize.height / 10,
                          width: _screenSize.width / 3.8,
                          padding: EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              //!BOTTOM CIRCLE
                              Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  radius: 28.0,
                                  backgroundColor: Color(0xFF827E9C),
                                ),
                              ),

                              //!TOP CIRCLE
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 28.0,
                                  backgroundColor:
                                      Color(0xFF050505).withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                        ),

                        //!CARD DETAILS
                        CustomTextWidget(
                            text: "Card Number",
                            textSize: 16.0,
                            fontWeight: FontWeight.w600,
                            textColour: Color(0xFF050505).withOpacity(0.3)),

                        CustomTextWidget(
                            text: "3 8 2 9  4 8 2 0",
                            textSize: 22.0,
                            fontWeight: FontWeight.w600,
                            textColour: Color(0xFF050505)),

                        //!USER NAME
                        CustomTextWidget(
                            text: "Serticode",
                            textSize: 18.0,
                            fontWeight: FontWeight.w600,
                            textColour: Color(0xFF050505))
                      ],
                    ),
                  );
                }),
          ),

          //!EXPENSE UPDATES TILES
          Container(
            height: _screenSize.height / 2.5,
            padding: EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: FaIcon(
                    leadingIcons[index],
                    size: 32,
                    color: _selectedBottomBarColor,
                  ),
                  title: CustomTextWidget(
                    text: itemTitles[index],
                    fontWeight: FontWeight.w600,
                    textSize: 22.0,
                    textColour: _selectedBottomBarColor,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomTextWidget(
                        text: "May 20, 3:41pm",
                        textSize: 16.0,
                        fontWeight: FontWeight.normal,
                        textColour: _selectedBottomBarColor.withOpacity(0.5)),
                  ),
                  trailing: CustomTextWidget(
                      text: itemPrices[index],
                      textSize: 16.0,
                      fontWeight: FontWeight.normal,
                      textColour: _selectedBottomBarColor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
