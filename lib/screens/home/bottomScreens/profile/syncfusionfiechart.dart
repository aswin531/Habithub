import 'package:flutter/material.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncFusionChart extends StatefulWidget {
  const SyncFusionChart({super.key});

  @override
  State<SyncFusionChart> createState() => _SyncFusionChartState();
}

class _SyncFusionChartState extends State<SyncFusionChart> {
  late List<HabitFiChart> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      backgroundColor: grey,
      series: <CircularSeries>[
        PieSeries<HabitFiChart, String>(
          dataSource: _chartData,
          xValueMapper: (HabitFiChart data, _) => data.habitname,
          yValueMapper: (HabitFiChart data, _) => data.date.day,
        )
      ],
    );
  }

  List<HabitFiChart> getChartData() {
    final List<HabitFiChart> chartData = [
      HabitFiChart('Habit 1', DateTime.now()),
      HabitFiChart('Habit 1', DateTime.now()),
      HabitFiChart('Habit 1', DateTime.now()),
      HabitFiChart('Habit 1', DateTime.now()),
    ];
    return chartData;
  }
}

class HabitFiChart {
  final String habitname;
  final DateTime date;
  HabitFiChart(this.habitname, this.date);
}
