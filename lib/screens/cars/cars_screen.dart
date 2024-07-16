// lib/screens/cars_screen.dart

import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  @override
  _CarsScreenState createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize data or state here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('No cars available'), // Placeholder content
      ),
    );
  }
}
