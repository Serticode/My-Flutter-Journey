import 'package:finance_layout/constants/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  final bool pageTitle;
  TopBar({Key key, @required this.pageTitle}) : super(key: key);
//  final Color _selectedBottomBarColor = Color(0xFFD0EAF9);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: _screenSize.height / 14,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //!THE ICON.
          FaIcon(
            FontAwesomeIcons.bars,
            size: 26.0,
            color: Color(0xFFA0A0BA),
          ),

          if (this.pageTitle)
            CustomTextWidget(
                text: "Wallet",
                textSize: 26.0,
                fontWeight: FontWeight.w600,
                textColour: Color(0xFFA0A0BA)),

          //!THE IMAGE.
          Container(
            width: 60.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Color(0xFF050505),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 2.0,
                  color: Color(0xFFA0A0BA),
                )),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("images/bg3.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
