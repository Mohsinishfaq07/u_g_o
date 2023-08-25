import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facial Expression Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FacialExpressionScreen(),
    );
  }
}

class FacialExpressionScreen extends StatefulWidget {
  @override
  _FacialExpressionScreenState createState() => _FacialExpressionScreenState();
}

class _FacialExpressionScreenState extends State<FacialExpressionScreen> {
  List<String> features = ["Happy", "Sad", "Neutral"];
  List<List<double>> data = [];

  @override
  void initState() {
    super.initState();
    generateRandomData();
  }
  void generateRandomData() {
    final random = Random();
    data = [List.generate(features.length, (index) => random.nextDouble() * 9 + 1)];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const ticks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Facial Expression Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: RadarChart.light(
                ticks: ticks,
                features: features,
                data: data,
                reverseAxis: true,
                useSides: false, // Set to false to disable polygon borders
              ),
            ),
          ],
        ),
      ),
    );
  }
}