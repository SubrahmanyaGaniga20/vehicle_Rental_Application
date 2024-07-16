import 'package:flutter/material.dart';
import 'package:apna_gadi/screens/splash_screen.dart';
import 'package:apna_gadi/screens/login_screen.dart';
import 'package:apna_gadi/screens/onboarding_screen.dart';
import 'package:apna_gadi/screens/home_screen.dart';
import 'package:apna_gadi/screens/booking_screen.dart';
import 'package:apna_gadi/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APNA GADI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash', // Set the initial route to splash screen
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
        '/bookings': (context) => BookingsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
