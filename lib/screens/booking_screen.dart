// lib/screens/bookings_screen.dart
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('This is the bookings screen.'),
      ),
    );
  }
}
