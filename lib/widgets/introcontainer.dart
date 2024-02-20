import 'package:flutter/material.dart';
import 'package:habit_hub/styles/textstyles/textstyles.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IntroContainerScreen extends StatelessWidget {
  final double progressValue;
  const IntroContainerScreen({super.key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueAccent,
        backgroundBlendMode: BlendMode.src,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Boost Your Day ',
              style: IntroContainerStyle,
            ),
          ),
          Expanded(
            child: SfRadialGauge(axes: <RadialAxis>[
              // Primary radial axis
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.7,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  color: searchcolor,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers:  <GaugePointer>[
                  RangePointer(
                    value: progressValue,
                    enableDragging: true,
                    width: 0.05,
                    pointerOffset: 0.07,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: favcolor,
                  )
                ],
              ),
              // Secondary radial axis for segmented line
              RadialAxis(
                minimum: 0,
                interval: 1,
                maximum: 4,
                showLabels: false,
                showTicks: true,
                showAxisLine: false,
                tickOffset: -0.05,
                offsetUnit: GaugeSizeUnit.factor,
                minorTicksPerInterval: 0,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.7,
                majorTickStyle: const MajorTickStyle(
                  length: 0.3,
                  thickness: 3,
                  lengthUnit: GaugeSizeUnit.factor,
                  color: Colors.white,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
