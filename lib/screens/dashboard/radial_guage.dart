import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGaugeWidget extends StatelessWidget {
  final double meterScore;

  RadialGaugeWidget({required this.meterScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SfRadialGauge(
        title: GaugeTitle(
          text: 'Overall Score',
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 10,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 2.5,
                color: Colors.red,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 2.5,
                endValue: 5,
                color: Colors.orange,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 5,
                endValue: 7.5,
                color: Colors.blue,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 7.5,
                endValue: 10,
                color: Colors.green,
                startWidth: 15,
                endWidth: 15,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: meterScore,
                enableAnimation: true,
                animationDuration: 4500,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                  child: Text(
                    meterScore.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
