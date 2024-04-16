import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

import '../models/BudgetItem.dart';

// enum
enum LegendShape { circle, rectangle }

class MyPieChart extends StatefulWidget {
  final List<BudgetItem> myBudgetItems;
  MyPieChart({super.key, required this.myBudgetItems});

  mydata() {
    // Creating a map from the list
    Map<String, double> itemMap = {};

    for (var item in myBudgetItems) {
      itemMap[item.name] = item.amount;
    }
    return itemMap;
  }

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  int key = 0;

  final dataMaps = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];
  LegendShape? _legendShape = LegendShape.circle;
  bool _showLegendLabel = false;

  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
    "Ionic": "Ionic legend",
  };
  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      key: ValueKey(key),
      dataMap: mydata(),
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 10,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      // centerText: _showCenterText ? "HYBRID" : null,
      // centerWidget: _showCenterWidget
      //     ? Container(color: Colors.red, child: const Text("Center"))
      //     : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
      ),
      ringStrokeWidth: 32,
      emptyColor: Colors.grey,
      gradientList: false ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
  }
}
