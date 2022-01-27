import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:web_dashboard/constants/constant_parameters.dart';
import 'package:web_dashboard/widgets/custom_text_widget.dart';

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
      home: WebDashboard(),
    );
  }
}

class WebDashboard extends StatelessWidget {
  WebDashboard({Key key}) : super(key: key);
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColour,
      body: Row(
        children: <Widget>[
          //!LEFT SIDE
          Expanded(
            flex: 1,
            child: Container(
              color: mainColour,
              padding: EdgeInsets.all(26.0),
              child: Column(
                children: <Widget>[
                  //!TITLE
                  Expanded(
                      flex: 1,
                      child: CustomTextWidget(
                          theText: "Cloud",
                          textSize: 32.0,
                          textFontWeight: FontWeight.w700,
                          textColour: accentColour)),

                  //!SET OF ICONS
                  Expanded(
                      flex: 8,
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 50.0);
                          },
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  rightSideIcons[index],
                                  size: iconsSize,
                                  color: accentColour,
                                ));
                          })),

                  //!SETTINGS BUTTON
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            rightSideIcons[5],
                            size: iconsSize,
                            color: accentColour,
                          ))),
                ],
              ),
            ),
          ),

          //!RIGHT SIDE
          Expanded(
            flex: 13,
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: secondaryColour,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //!SPACER
                  SizedBox(
                    width: 40.0,
                  ),

                  //!DETAILS SECTION
                  Expanded(
                      flex: 8,
                      child: Container(
                        color: secondaryColour,
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //!SEARCH BAR
                            Container(
                              height: 60.0,
                              child: TextFormField(
                                key: _formKey,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: mainColour.withOpacity(0.1),
                                  contentPadding: EdgeInsets.all(12.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: iconsSize,
                                    color: accentColour,
                                  ),
                                  hintText: "   Search",
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),

                            //!NAME AND GREETINGS BAR
                            Container(
                              padding: EdgeInsets.all(8.0),
                              height: 60.0,
                              child: Row(
                                children: <Widget>[
                                  //!GREETING IN BOLD
                                  CustomTextWidget(
                                      theText: "Hey Serticode,",
                                      textSize: 28.0,
                                      textFontWeight: FontWeight.w600,
                                      textColour:
                                          Colors.black87.withOpacity(0.8)),

                                  //!WELCOME STATEMENT
                                  CustomTextWidget(
                                      theText: "   Welcome to Cloud",
                                      textSize: 28.0,
                                      textFontWeight: FontWeight.normal,
                                      textColour:
                                          Colors.black87.withOpacity(0.8))
                                ],
                              ),
                            ),

                            //!DRIVE OPTIONS
                            Container(
                              height: 150.0,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //!DRIVE 1
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(12.0),
                                        width: _screenSize.width / 5,
                                        decoration: BoxDecoration(
                                          color: mainColour.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //!DRIVE LOGO/ICON
                                            Container(
                                              width: 120.0,
                                              height: 120.0,
                                              padding: EdgeInsets.all(25.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color:
                                                    mainColour.withOpacity(0.1),
                                              ),
                                              child: Container(
                                                height: 20.0,
                                                width: 20.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "images/googleDrive.png"),
                                                        fit: BoxFit.contain)),
                                              ),
                                            ),

                                            //!DRIVE DETAILS
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                //!DRIVE NAME
                                                CustomTextWidget(
                                                    theText: driveNames[0],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.w600,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.8)),

                                                //!DRIVE SIZE
                                                CustomTextWidget(
                                                    theText:
                                                        driveSizesAndFreeSpace[
                                                            0],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.normal,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.4))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),

                                  //!SPACER 1
                                  SizedBox(
                                    width: 30.0,
                                  ),

                                  //!DRIVE 2
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(12.0),
                                        width: _screenSize.width / 5,
                                        decoration: BoxDecoration(
                                          color: mainColour.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //!DRIVE LOGO/ICON
                                            Container(
                                              width: 120.0,
                                              height: 120.0,
                                              padding: EdgeInsets.all(25.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color:
                                                    mainColour.withOpacity(0.1),
                                              ),
                                              child: Container(
                                                height: 20.0,
                                                width: 20.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/dropbox.png"),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                            ),

                                            //!DRIVE DETAILS
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                //!DRIVE NAME
                                                CustomTextWidget(
                                                    theText: driveNames[1],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.w600,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.8)),

                                                //!DRIVE SIZE
                                                CustomTextWidget(
                                                    theText:
                                                        driveSizesAndFreeSpace[
                                                            1],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.normal,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.4))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),

                                  //!SPACER 2
                                  SizedBox(
                                    width: 30.0,
                                  ),

                                  //!DRIVE 3
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(12.0),
                                        width: _screenSize.width / 5,
                                        decoration: BoxDecoration(
                                          color: mainColour.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //!DRIVE LOGO/ICON
                                            Container(
                                              width: 120.0,
                                              height: 120.0,
                                              padding: EdgeInsets.all(25.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color:
                                                    mainColour.withOpacity(0.1),
                                              ),
                                              child: Container(
                                                height: 20.0,
                                                width: 20.0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/oneDrive.png"),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                            ),

                                            //!DRIVE DETAILS
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                //!DRIVE NAME
                                                CustomTextWidget(
                                                    theText: driveNames[2],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.w600,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.8)),

                                                //!DRIVE SIZE
                                                CustomTextWidget(
                                                    theText:
                                                        driveSizesAndFreeSpace[
                                                            2],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.normal,
                                                    textColour: Colors.black87
                                                        .withOpacity(0.4))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),

                            //!CALENDER OPTIONS
                            Container(
                              height: 180.0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 24.0),
                              decoration: BoxDecoration(
                                color: mainColour.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //!CALENDER MONTH
                                      CustomTextWidget(
                                          theText: displayDate,
                                          textSize: 22.0,
                                          textFontWeight: FontWeight.w600,
                                          textColour: mainColour),

                                      //!DROP DOWN
                                      Container(
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: mainColour.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //!DROP DOWN NAME
                                            CustomTextWidget(
                                                theText: dropDownName,
                                                textSize: 18.0,
                                                textFontWeight: FontWeight.w600,
                                                textColour: mainColour),

                                            //!DROP DOWN ICON
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  dropDownIcon,
                                                  color: mainColour,
                                                  size: 32,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),

                                  //!CALENDER DAYS
                                  Expanded(
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 7,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 40.0,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                            color: secondaryColour,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              //!DAY
                                              Container(
                                                padding: EdgeInsets.all(12.0),
                                                decoration: BoxDecoration(
                                                  color: calenderDays[index] ==
                                                          "WED"
                                                      ? mainColour
                                                      : mainColour
                                                          .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: CustomTextWidget(
                                                    theText:
                                                        calenderDays[index],
                                                    textSize: 18.0,
                                                    textFontWeight:
                                                        FontWeight.w600,
                                                    textColour:
                                                        calenderDays[index] ==
                                                                "WED"
                                                            ? secondaryColour
                                                            : mainColour),
                                              ),

                                              //!DATE
                                              CustomTextWidget(
                                                  theText:
                                                      calenderDaysDate[index],
                                                  textSize: 18.0,
                                                  textFontWeight:
                                                      FontWeight.normal,
                                                  textColour: mainColour),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //!EVENTS OPTIONS
                            Container(
                              height: 400.0,
                              padding: EdgeInsets.all(24.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: mainColour.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //!TITLE BAR
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //!RECENT FILES
                                      CustomTextWidget(
                                          theText: "Recent files",
                                          textSize: 22.0,
                                          textFontWeight: FontWeight.w600,
                                          textColour: mainColour),

                                      //!VIEW ALL FILES
                                      CustomTextWidget(
                                          theText: "View all",
                                          textSize: 22.0,
                                          textFontWeight: FontWeight.w600,
                                          textColour: mainColour),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20.0,
                                  ),

                                  //!TABLE SECTIONS BAR
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //!NAME OF FILES
                                      Expanded(
                                        flex: 3,
                                        child: CustomTextWidget(
                                            theText: "Name",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),

                                      //!DATE CREATED
                                      Expanded(
                                        flex: 2,
                                        child: CustomTextWidget(
                                            theText: "Date Created",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),

                                      //!SIZE
                                      Expanded(
                                        flex: 1,
                                        child: CustomTextWidget(
                                            theText: "Size",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),

                                      //!DATE CREATED 2
                                      Expanded(
                                        flex: 2,
                                        child: CustomTextWidget(
                                            theText: "Date Created",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),

                                      //!MEMBERS
                                      Expanded(
                                        flex: 2,
                                        child: CustomTextWidget(
                                            theText: "Members",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),

                                      //!VIEW ALL FILES
                                      Expanded(
                                        flex: 1,
                                        child: CustomTextWidget(
                                            theText: "",
                                            textSize: 22.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour:
                                                mainColour.withOpacity(0.7)),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),

                                  //!EVENTS
                                  Expanded(
                                      child: ListView.separated(
                                    itemCount: 6,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 15.0,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          //!NAME OF FILES
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //!IMAGE
                                                Container(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  color: mainColour
                                                      .withOpacity(0.1),
                                                  child: fileName[index]
                                                          .contains("doc")
                                                      ? Image(
                                                          image: AssetImage(
                                                              "images/word.png"),
                                                          fit: BoxFit.contain,
                                                        )
                                                      : fileName[index]
                                                              .contains(
                                                                  "Account")
                                                          ? Image(
                                                              image: AssetImage(
                                                                  "images/excel.png"),
                                                              fit: BoxFit
                                                                  .contain,
                                                            )
                                                          : Image(
                                                              image: AssetImage(
                                                                  "images/file.png"),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                ),
                                                SizedBox(
                                                  width: 20.0,
                                                ),
                                                CustomTextWidget(
                                                    theText: fileName[index],
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.w600,
                                                    textColour: mainColour),
                                              ],
                                            ),
                                          ),

                                          //!DATE CREATED
                                          Expanded(
                                            flex: 2,
                                            child: CustomTextWidget(
                                                theText: dateCreated[index],
                                                textSize: 22.0,
                                                textFontWeight: FontWeight.w600,
                                                textColour: mainColour),
                                          ),

                                          //!SIZE
                                          Expanded(
                                            flex: 1,
                                            child: CustomTextWidget(
                                                theText: fileSize[index],
                                                textSize: 22.0,
                                                textFontWeight: FontWeight.w600,
                                                textColour: mainColour),
                                          ),

                                          //!DATE CREATED 2
                                          Expanded(
                                            flex: 2,
                                            child: CustomTextWidget(
                                                theText: createdBy,
                                                textSize: 22.0,
                                                textFontWeight: FontWeight.w600,
                                                textColour: mainColour),
                                          ),

                                          //!MEMBERS
                                          Expanded(
                                              flex: 2,
                                              child: index == 0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          height: 30.0,
                                                          width: 30.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/Serticode.jpg"),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          width: 30.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/1.jpg"),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          width: 30.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/2.jpg"),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          width: 30.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/3.jpg"),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                        ),
                                                        Container(
                                                          height: 30.0,
                                                          width: 30.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/4.jpg"),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                        )
                                                      ],
                                                    )
                                                  : index == 1
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              height: 30.0,
                                                              width: 30.0,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          "images/Serticode.jpg"),
                                                                      fit: BoxFit
                                                                          .contain)),
                                                            ),
                                                            Container(
                                                              height: 30.0,
                                                              width: 30.0,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          "images/4.jpg"),
                                                                      fit: BoxFit
                                                                          .contain)),
                                                            ),
                                                            Container(
                                                              height: 30.0,
                                                              width: 30.0,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          "images/5.jpg"),
                                                                      fit: BoxFit
                                                                          .contain)),
                                                            ),
                                                          ],
                                                        )
                                                      : (index == 2 ||
                                                              index == 3)
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  height: 30.0,
                                                                  width: 30.0,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              "images/4.jpg"),
                                                                          fit: BoxFit
                                                                              .contain)),
                                                                ),
                                                                Container(
                                                                  height: 30.0,
                                                                  width: 30.0,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              "images/Serticode.jpg"),
                                                                          fit: BoxFit
                                                                              .contain)),
                                                                ),
                                                              ],
                                                            )
                                                          : Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                height: 30.0,
                                                                width: 30.0,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "images/1.jpg"),
                                                                        fit: BoxFit
                                                                            .contain)),
                                                              ),
                                                            )),

                                          //!VIEW ALL FILES
                                          Expanded(
                                            flex: 1,
                                            child: CustomTextWidget(
                                                theText: ellipses,
                                                textSize: 22.0,
                                                textFontWeight: FontWeight.w600,
                                                textColour: mainColour),
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),

                  //!SPACER
                  SizedBox(
                    width: 60.0,
                  ),

                  //!CHART SECTION
                  Expanded(
                      flex: 2,
                      child: Container(
                          color: secondaryColour,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //!TOP CONTAINER
                                Container(
                                  height: _screenSize.height / 3,
                                  padding: EdgeInsets.all(20.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: mainColour,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //!TEXT
                                      CustomTextWidget(
                                          theText: "Cloud Storage",
                                          textSize: 18.0,
                                          textFontWeight: FontWeight.w600,
                                          textColour: secondaryColour),

                                      //!LIQUID PROGRESS INDICATOR
                                      Align(
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundColor:
                                              secondaryColour.withOpacity(0.3),
                                          child: CircleAvatar(
                                            radius: 98,
                                            backgroundColor:
                                                Colors.black26.withOpacity(0.3),
                                            child: CircleAvatar(
                                              radius: 90.0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child:
                                                  LiquidCircularProgressIndicator(
                                                value: 0.7, // Defaults to 0.5.
                                                valueColor: AlwaysStoppedAnimation(
                                                    accentColour), // Defaults to the current Theme's accentColor.
                                                backgroundColor: Colors.black26
                                                    .withOpacity(
                                                        0.3), // Defaults to the current Theme's backgroundColor.
                                                borderColor: Colors.transparent,
                                                borderWidth: 5.0,
                                                direction: Axis
                                                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                                center: CustomTextWidget(
                                                    theText: "70%",
                                                    textSize: 22.0,
                                                    textFontWeight:
                                                        FontWeight.w700,
                                                    textColour: mainColour),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //!STORAGE LEVEL
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          //!TEXT
                                          Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 10.0,
                                                backgroundColor: accentColour,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              CustomTextWidget(
                                                  theText: "Used 74.5GB",
                                                  textSize: 14.0,
                                                  textFontWeight:
                                                      FontWeight.w600,
                                                  textColour: secondaryColour),
                                            ],
                                          ),

                                          SizedBox(
                                            width: 30.0,
                                          ),

                                          //!TEXT
                                          Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 10.0,
                                                backgroundColor: mainColour,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              CustomTextWidget(
                                                  theText: "Left 25.4GB",
                                                  textSize: 14.0,
                                                  textFontWeight:
                                                      FontWeight.w600,
                                                  textColour: secondaryColour),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                //!BOTTOM CONTAINER
                                Container(
                                  height: _screenSize.height / 3,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: mainColour,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //!IMAGE
                                      Container(
                                        height: _screenSize.height / 8,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "images/cloudBackup.png"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),

                                      //!TEXT
                                      CustomTextWidget(
                                          theText:
                                              "Get more space for your \nStorage today",
                                          textSize: 16.0,
                                          textFontWeight: FontWeight.w600,
                                          textColour: secondaryColour),

                                      //!ELEVATED BUTTON
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.0,
                                                vertical: 20.0),
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            )),
                                        child: CustomTextWidget(
                                            theText: "Upgrade",
                                            textSize: 18.0,
                                            textFontWeight: FontWeight.w600,
                                            textColour: secondaryColour),
                                      )
                                    ],
                                  ),
                                ),
                              ])))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
