// lib/widget/vehicle_card.dart

import 'package:flutter/material.dart';
import 'package:apna_gadi/models/vehicals.dart'; // Ensure the path is correct

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(vehicle.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              vehicle.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Price: \$${vehicle.price}'),
          ),
        ],
      ),
    );
  }
}
