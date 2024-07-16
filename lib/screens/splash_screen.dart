import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apna_gadi/screens/login_screen.dart'; // Import your next screen here

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a few seconds of waiting before navigating to the next screen
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: 300, // Adjust width as necessary
              height: 300, // Adjust height as necessary
              fit: BoxFit.cover, // Ensure the image fits within its bounds
            ),
            Positioned(
              bottom:
                  60, // Adjust this value to position the text inside the image
              child: Container(
                width: 300, // Match the width of the image
                padding: EdgeInsets.symmetric(vertical: 5.0),
                color: Colors.white.withOpacity(
                    0.7), // Semi-transparent background for readability
                child: Text(
                  'Choose your own wheels',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color
                  ),
                  textAlign: TextAlign.center, // Center-align the text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
