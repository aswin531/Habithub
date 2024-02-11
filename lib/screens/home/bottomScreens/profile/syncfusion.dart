import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncFusionScreen extends StatelessWidget {
  SyncFusionScreen({Key? key}) : super(key: key);

  final List<ChartData> chartData = [
    ChartData('Habit 1', 20, 30, 40, 50),
    ChartData('Habit 2', 40, 20, 10, 16),
    ChartData('Habit 3', 25, 20, 10, 22),
    ChartData('Habit 4', 10, 14, 22, 44),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y1),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y1),
                  StackedColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData ch, _) => ch.x,
                      yValueMapper: (ChartData ch, _) => ch.y1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String? x;
  final int? y1;
  final int? y2;
  final int? y3;
  final int? y4;
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
}
