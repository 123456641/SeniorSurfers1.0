import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

class GoogleMeetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DeviceFrame(
          device: Devices.android.samsungGalaxyNote20,
          isFrameVisible: true,
          screen: Builder(
            builder: (context) => Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (_) => _PhoneContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Text(
                'Welcome to Google Meet Tutorial',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Let’s first click on the Google Meet app that looks like this',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => _GMeetOpenedPage()),
                  );
                },
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.2),
                hoverColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/practice/gmeet.png',
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Google Meet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _GMeetOpenedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1B1014),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  'Welcome to Google Meet',
                  style: TextStyle(
                    fontFamily: 'Caros',
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Make video calls to friends and family or create and join meetings, all in one app',
                  style: TextStyle(
                    fontFamily: 'Caros',
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0),
                Image.asset(
                  'assets/images/gmeetdesign.png',
                  width: 600,
                  height: 400,
                ),
              ],
            ),
          ),
          // Bottom tab section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                color: Color(0xFF2C1D22),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Rounded tab
                  Positioned(
                    top: -20,
                    left: (screenWidth / 2) - 50, // Center the tab (100 width / 2)
                    child: Container(
                      width: 100, // ~1 inch
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B1014),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  // Blue circle overlapping left side of tab
                  Positioned(
                    top: 5,
                    left: (screenWidth / 2) - 65, // 15px to the left of the tab
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

