import 'package:flutter/material.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SyncFusionGuage extends StatefulWidget {
  const SyncFusionGuage({super.key});

  @override
  State<SyncFusionGuage> createState() => _SyncFusionGuageState();
}

class _SyncFusionGuageState extends State<SyncFusionGuage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 150,
              pointers:const <GaugePointer>[
                NeedlePointer(
                  value: 90,
                  enableAnimation: true,
                )
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 50,
                  color: green,
                ),
                GaugeRange(
                  startValue: 50,
                  endValue: 100,
                  color: yellow,
                ),
                GaugeRange(
                  startValue: 100,
                  endValue: 150,
                  color: red,
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
