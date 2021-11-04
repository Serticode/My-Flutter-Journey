import 'package:flutter/material.dart';
import 'package:treyon/constants/chart.dart';
import 'package:treyon/constants/model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final _modelObject = Customer();

Widget containerDetails({BuildContext buildContext}) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 30.0,
      ),

      //!STATISTICS
      Column(
        children: <Widget>[
          //!HEADER ...
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Statistics",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.pink.shade600,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),

          //!BASE ...
          Container(
            height: MediaQuery.of(buildContext).size.height / 3.2,
            child: Column(
              children: <Widget>[
                //!INCOME CARD
                Card(
                  color: Colors.pink.shade600,
                  elevation: 5.0,
                  margin: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                wordSpacing: 1.5,
                              ),
                            ),
                            Text(
                              "\$7,298",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: /* SecondChart() */ SimpleLineChart(
                              _createSampleData()),
                        ),
                      ],
                    ),
                  ),
                ),

                //!OUTCOME CARD
                Card(
                  color: Colors.white,
                  elevation: 10.0,
                  shadowColor: Colors.black.withOpacity(0.5),
                  margin: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Outcome",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                wordSpacing: 1.5,
                              ),
                            ),
                            Text(
                              "\$1,345",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: SimpleLineChart(_createSampleData()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //!YOUR TRANSACTIONS
      Column(
        children: <Widget>[
          //!YOUR TRANSACTIONS
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Your transactions",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),

          //!BASE ...
          Container(
            height: MediaQuery.of(buildContext).size.height / 3.2,
            child: PageView.builder(
              itemCount: 3,
              controller: PageController(
                viewportFraction: 0.5,
              ),
              itemBuilder: (_, index) {
                return Transform.scale(
                  alignment: Alignment.centerLeft,
                  scale: 0.9,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.black.withOpacity(0.3),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.pink.shade600,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    _modelObject.transactionPicturesUrl
                                        .elementAt(index),
                                  ),
                                  radius: 28.0,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_vert_sharp,
                                  size: 30.0,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                onPressed: () =>
                                    print("TRANSACTION CARD PRESSED."),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              _modelObject.transactionNames.elementAt(index),
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //!TRANSACTION AMOUNTS
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    _modelObject.transactionFigures
                                        .elementAt(index),
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      wordSpacing: 1.5,
                                    ),
                                  ),
                                ),

                                //!TRANSACTION DATES
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                  ),
                                  child: Text(
                                    _modelObject.transactionDates
                                        .elementAt(index),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      wordSpacing: 1.2,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

List<charts.Series<LinearSales, int>> _createSampleData() {
  final data = [
    new LinearSales(0, 460),
    new LinearSales(1, 200),
    new LinearSales(2, 930),
    new LinearSales(3, 450),
    new LinearSales(4, 680),
    new LinearSales(5, 320),
  ];

  return [
    new charts.Series<LinearSales, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (LinearSales sales, _) => sales.month,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data,
    )
  ];
}
