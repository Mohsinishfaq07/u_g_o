import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ansicolor/ansicolor.dart';

class VocalFeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech analytics',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
        ),
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Speech Analytics',
            style: TextStyle(color: Colors.white), // Set title color to white
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white, // Set arrow color to white
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.000000000001),
                MyColoredBox(),
                SizedBox(height: 0.000000000001),
                FillerWordBox(),
                SizedBox(height: 0.000000000001),
                RepeatedWordBox(),
                SizedBox(height: 0.000000000001),
                UniqueWordBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class MyColoredBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rateOfSpeech = generateRandomNumber(10);
    final purplePen = AnsiPen()..rgb(r: 128, g: 0, b: 128);

    return Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.purple,
            child: Text(
              'Rate of Speech: $rateOfSpeech WPM',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class FillerWordBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loremIpsum = generateRandomString(50);

    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              'Filler Words',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              loremIpsum,
            ),
          ),
        ],
      ),
    );
  }
}

class RepeatedWordBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loremIpsum = generateRandomString(50);

    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              'Repeated Words',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              loremIpsum,
            ),
          ),
        ],
      ),
    );
  }
}

class UniqueWordBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loremIpsum = generateRandomString(50);

    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              'Unique Words',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              loremIpsum,
            ),
          ),
        ],
      ),
    );
  }
}

int generateRandomNumber(int max) {
  Random random = Random();
  return random.nextInt(max + 1);
}

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}

void main() {
  runApp(VocalFeatureScreen());
}
