// lib/screens/bikes_screen.dart

import 'package:flutter/material.dart';

class BikesScreen extends StatefulWidget {
  @override
  _BikesScreenState createState() => _BikesScreenState();
}

class _BikesScreenState extends State<BikesScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize data or state here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bikes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('No bikes available'), // Placeholder content
      ),
    );
  }
}
