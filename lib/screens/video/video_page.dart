import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:u_g_o/screens/video/processing/video_processing.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  double _uploadProgress = 0.0;
  String _videoName = '';
  bool _isVideoSelected = false;

  Future<void> _handleChooseVideo() async {
    final videoPicker = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (videoPicker != null) {
      setState(() {
        _videoName = videoPicker.name ?? '';
        _isVideoSelected = true;
      });
    }
  }

  void _handleUploadVideo() {
    // TODO: Add code to handle video upload and update _uploadProgress accordingly
    // For demonstration purposes, let's simulate the progress with a timer
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_uploadProgress < 1.0) {
        setState(() {
          _uploadProgress += 0.1;
        });
      } else {
        setState(() {
          _uploadProgress = 1.0; // Set progress to 1.0 (100%) when upload is complete
        });
        timer.cancel();
        // Navigate to the next page automatically when the upload is complete
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoProcessingScreen()),
        );
      }
    });
  }

  String getProgressText() {
    return '${(_uploadProgress * 100).toStringAsFixed(1)}% uploaded';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/images/main_top.png',
            height: 300.0,
            width: 300.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Your Video',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleChooseVideo,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6F35A5), // Set the button's background color
                minimumSize: Size(200, 40), // Set the minimum size of the button
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Set the padding around the button's child
              ),
              child: Text(
                'Choose Video',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleUploadVideo,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6F35A5), // Set the button's background color
                minimumSize: Size(200, 40), // Set the minimum size of the button
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Set the padding around the button's child
              ),
              child: Text(
                'Upload Video',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            if (_isVideoSelected)
              Text(
                _videoName,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: _uploadProgress,
              minHeight: 10.0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 8.0),
            Text(
              getProgressText(),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFF1E6FF)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Instructions for uploading a video:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '1. Tap the "Choose Video" button below.\n'
                        '2. Select the video you want to upload from your device.\n'
                        '3. Wait for the video to finish uploading.\n'
                        '4. Your video will be available for viewing once the upload is complete.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
