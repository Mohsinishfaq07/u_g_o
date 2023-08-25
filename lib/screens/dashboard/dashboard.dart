import 'dart:math';

import 'package:flutter/material.dart';
import 'package:u_g_o/screens/dashboard/radial_guage.dart';
import 'package:u_g_o/screens/dashboard/combineradial.dart';

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double meterScore = 0.0;

  @override
  void initState() {
    super.initState();
    generateRandomScore();
  }

  void generateRandomScore() {
    final random = Random();
    setState(() {
      meterScore = random.nextDouble() * 10;
    });
  }

  void navigateToSettingScreen() {
    // Add navigation logic to the Setting screen
  }

  void navigateToLogoutScreen() {
    // Add navigation logic to the Logout screen
  }

  void navigateToAboutScreen() {
    // Add navigation logic to the About screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.0),
            Expanded(
              child: RadialGaugeWidget(meterScore: meterScore),
            ),
            SizedBox(height: 6),
            Expanded(
              child: CombinedRadial(),
            ),
          ],
        ),
      ),
    );
  }
}
