import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants/widgets/custom_text_widget.dart';
import 'constants/widgets/top_bar.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key key}) : super(key: key);
  final Color barsAndBackgroundColour = Color(0xFFD0EAF9);
  final Color _selectedBottomBarColor = Color(0xFFD0EAF9);

  final List<String> itemTitles = [
    "Expense",
    "Income",
  ];
  final List<String> itemPrices = [
    "\$200.00",
    "\$1500.00",
  ];

  final List leadingIcons = [
    FontAwesomeIcons.spotify,
    FontAwesomeIcons.shoppingCart,
    FontAwesomeIcons.pizzaSlice,
  ];

  double barChartWidth = 25.0;

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
            pageTitle: true,
          ),

          //!PAGE SELECTION
          Container(
            height: _screenSize.height / 16,
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //!PAGE DETAILS
                Container(
                  alignment: Alignment.center,
                  width: _screenSize.width / 4,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: barsAndBackgroundColour,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CustomTextWidget(
                      text: "Week",
                      textSize: 22.0,
                      fontWeight: FontWeight.w600,
                      textColour: Color(0xFF050505)),
                ),

                CustomTextWidget(
                    text: "Month",
                    textSize: 22.0,
                    fontWeight: FontWeight.w600,
                    textColour: Color(0xFFA0A0BA)),

                //!USER NAME
                CustomTextWidget(
                    text: "Year",
                    textSize: 22.0,
                    fontWeight: FontWeight.w600,
                    textColour: Color(0xFFA0A0BA))
              ],
            ),
          ),

          //!GRAPH DETAILS
          Container(
            height: _screenSize.height / 3,
            padding: EdgeInsets.all(4.0),
            child: BarChart(
              BarChartData(
                barTouchData: barTouchData,
                titlesData: titlesData,
                borderData: borderData,
                barGroups: barGroups,
                gridData: FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
                maxY: 8,
              ),
            ),
          ),

          //!EXPENSE UPDATES TILES
          Container(
            height: _screenSize.height / 4,
            //color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: _screenSize.height / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //!LEADING
                      CustomTextWidget(
                        text: itemTitles[index],
                        fontWeight: FontWeight.w600,
                        textSize: 22.0,
                        textColour: _selectedBottomBarColor,
                      ),

                      //!LINE CHART
                      Expanded(child: LineChart(lineChartData())),

                      //!TRAILING
                      CustomTextWidget(
                          text: itemPrices[index],
                          textSize: 16.0,
                          fontWeight: FontWeight.normal,
                          textColour: _selectedBottomBarColor),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xFFD0EAF9),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        margin: 20,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'Feb';
            case 1:
              return 'Mar';
            case 2:
              return 'Apr';
            case 3:
              return 'May';
            case 4:
              return 'Jun';
            case 5:
              return 'Jul';
            case 6:
              return 'Aug';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      rightTitles: SideTitles(showTitles: false),
    );

FlBorderData get borderData => FlBorderData(
      show: false,
    );

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: const EdgeInsets.all(0),
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.y.round().toString(),
            const TextStyle(
              color: Color(0xFFD0EAF9),
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

Color barColourOne = Color(0xFFD0EAF9);
Color barColourTwo = Color(0xFFA0A0BA);
double barWidth = 10.0;
List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            y: 2,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            y: 6,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            y: 3,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: 4,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: 5,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: 2,
            colors: [barColourOne, barColourTwo],
            width: barWidth,
            borderRadius: BorderRadius.circular(5.0),
          )
        ],
      ),
    ];

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

//!LINE CHART
LineChartData lineChartData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
      /* drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      }, */
    ),
    /* titlesData: FlTitlesData(
      show: false,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 32,
        margin: 12,
      ),
    ), */
    borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11.8, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        /* belowBarData: BarAreaData(
          show: false,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ), */
      ),
    ],
  );
}
