// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoneyManagerHome extends StatelessWidget {
  const MoneyManagerHome({super.key});

  @override
  Widget build(BuildContext context) {
    double income = 1.0;
    double expenses = 1.0;

    return Scaffold(
      appBar: AppBar(title: const Text("Money Manager")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('Your Transactions'),
            Expanded(
              child: PieChart(
                PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    sections: <PieChartSectionData>[
                      PieChartSectionData(
                          value: income, title: 'Income', color: Colors.green),
                      PieChartSectionData(
                          value: expenses, title: 'Expenses', color: Colors.red)
                    ]),
                swapAnimationDuration: const Duration(milliseconds: 500),
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
