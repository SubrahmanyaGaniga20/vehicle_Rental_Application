// lib/screens/suvs_screen.dart

import 'package:flutter/material.dart';

class SUVsScreen extends StatefulWidget {
  @override
  _SUVsScreenState createState() => _SUVsScreenState();
}

class _SUVsScreenState extends State<SUVsScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize data or state here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUVs'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('No SUVs available'), // Placeholder content
      ),
    );
  }
}
