import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pie Chart Example'),
        ),
        body: Center(
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              startDegreeOffset: 90,
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: 40,
                  title: '40%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 30,
                  title: '30%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: 30,
                  title: '20%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.amber,
                  value: 30,
                  title: '10%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
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
