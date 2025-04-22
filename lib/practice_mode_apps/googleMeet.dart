import 'package:flutter/material.dart';

class GoogleMeetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice: Google Meet'),
      ),
      body: Center(
        child: Text(
          'This is the Google Meet practice page.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
