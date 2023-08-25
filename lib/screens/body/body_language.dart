import 'dart:math';
import 'package:flutter/material.dart';

class BodyLanguageScreen extends StatefulWidget {
  @override
  _BodyLanguageScreenState createState() => _BodyLanguageScreenState();
}

class _BodyLanguageScreenState extends State<BodyLanguageScreen> {
  double _audienceIntegrationProgress = 0.0;
  double _feetMovementProgress = 0.0;
  double _handUsedProgress = 0.0;
  double _bodyConfidenceProgress = 0.0;

  @override
  void initState() {
    super.initState();
    generateRandomProgress();
  }

  void generateRandomProgress() {
    final random = Random();
    _audienceIntegrationProgress = random.nextDouble() * 10;
    _feetMovementProgress = random.nextDouble() * 10;
    _handUsedProgress = random.nextDouble() * 10;
    _bodyConfidenceProgress = random.nextDouble() * 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Language Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildProgressBar('Audience Integration', _audienceIntegrationProgress, Colors.blue),
              SizedBox(height: 16),
              buildProgressBar('Feet Movement', _feetMovementProgress, Colors.green),
              SizedBox(height: 16),
              buildProgressBar('Hand Used', _handUsedProgress, Colors.red),
              SizedBox(height: 16),
              buildProgressBar('Body Confidence', _bodyConfidenceProgress, Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgressBar(String label, double progress, Color color) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8), // Adjust the left padding as needed
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 16,
          color: Colors.grey[200],
          child: Stack(
            children: [
              Container(
                width: double.infinity * (progress / 10),
                height: 16,
                color: color,
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BodyLanguageScreen(),
  ));
}
