import 'package:flutter/material.dart';
import 'package:u_g_o/screens/dashboard/dashboard.dart';

class VideoProcessingScreen extends StatefulWidget {
  @override
  _VideoProcessingScreenState createState() => _VideoProcessingScreenState();
}

class _VideoProcessingScreenState extends State<VideoProcessingScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;
  double _processingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _startProcessing();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _startProcessing() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as needed
    );

    _animationController!.addListener(() {
      setState(() {
        _processingProgress = _animationController!.value;
      });
    });

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Processing completed
        // Add any additional logic here

        // Navigate to the Dashboard screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    });

    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Processing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Processing Video',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              child: LinearProgressIndicator(
                value: _processingProgress,
                minHeight: 10.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '${(_processingProgress * 100).toStringAsFixed(1)}% Complete',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
