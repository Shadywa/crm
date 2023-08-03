import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

// Define the data for the bar chart
final List<charts.Series<MonthSales, String>> data = [
  charts.Series<MonthSales, String>(
    id: 'sales',
    domainFn: (MonthSales sales, _) => sales.month,
    measureFn: (MonthSales sales, _) => sales.revenue,
    data: [
      MonthSales('Jan', 5000),
      MonthSales('Feb', 7500),
      MonthSales('Mar', 10000),
      MonthSales('Apr', 8500),
      MonthSales('May', 12000),
      MonthSales('Jun', 9000),
    ],
  ),
];

// Define the bar chart widget
final Widget barChart = charts.BarChart(
  data,
  animate: true,
  vertical: true,
  barRendererDecorator: charts.BarLabelDecorator<String>(),
  domainAxis: const charts.OrdinalAxisSpec(
    renderSpec: charts.SmallTickRendererSpec(
      labelRotation: 60,
    ),
  ),
);

// Define the MonthSales class for the data
class MonthSales {
  final String month;
  final int revenue;

  MonthSales(this.month, this.revenue);
}

// Display the bar chart in the statistics screen
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(title: const Text('Sales Revenue')),
        body: PhysicalModel(
          color: secondaryColor,
          child: Column(
            children: [
              Center(child: barChart),
            ],
          ),
        ),
      ),
    );
  }
}
