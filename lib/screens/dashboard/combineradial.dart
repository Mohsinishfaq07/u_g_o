import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:u_g_o/screens/body/body_language.dart';
import 'package:u_g_o/screens/facial/facial_expression.dart';
import 'package:u_g_o/screens/vocal/vocal_feature.dart';

class CombinedRadial extends StatefulWidget {
  @override
  _CombinedRadialState createState() => _CombinedRadialState();
}

class _CombinedRadialState extends State<CombinedRadial> {
  List<double> gaugeValues = [0.0, 0.0, 0.0]; // Initial gauge values

  void generateRandomValues() {
    final random = Random();
    setState(() {
      gaugeValues[0] = random.nextDouble() * 10; // Generates a random value between 0 and 10 for the first gauge
      gaugeValues[1] = random.nextDouble() * 10; // Generates a random value between 0 and 10 for the second gauge
      gaugeValues[2] = random.nextDouble() * 10; // Generates a random value between 0 and 10 for the third gauge
    });
  }

  Color getColor(double value) {
    if (value >= 1 && value <= 2.5) {
      return Colors.red;
    } else if (value > 2.5 && value <= 5) {
      return Colors.orange;
    } else if (value > 5 && value <= 7.5) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  void initState() {
    super.initState();
    generateRandomValues(); // Generate random values when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Individual Score',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildGauge(0),
                buildGauge(1),
                buildGauge(2),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallButton(
                  color: Colors.red,
                  label: 'Body Language',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BodyLanguageScreen()),
                    );
                  },
                ),
                SmallButton(
                  color: Colors.orange,
                  label: 'Facial Expression',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FacialExpressionScreen()),
                    );
                  },
                ),
                SmallButton(
                  color: Colors.blue,
                  label: 'Speech Analytics',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VocalFeatureScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGauge(int index) {
    double value = gaugeValues[index];
    Color color = getColor(value);

    return Container(
      width: 100,
      height: 120,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 10,
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.1,
              cornerStyle: CornerStyle.bothCurve,
              color: Colors.transparent, // Set the axis line color to transparent
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              NeedlePointer(
                value: value,
                enableAnimation: true,
                animationDuration: 1000,
                needleColor: Colors.black,
              ),
            ],
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 2.5,
                color: Colors.red,
              ),
              GaugeRange(
                startValue: 2.5,
                endValue: 5,
                color: Colors.orange,
              ),
              GaugeRange(
                startValue: 5,
                endValue: 7.5,
                color: Colors.blue,
              ),
              GaugeRange(
                startValue: 7.5,
                endValue: 10,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const SmallButton({Key? key, required this.color, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CombinedRadial(),
  ));
}
