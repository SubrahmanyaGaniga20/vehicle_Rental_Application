import 'package:flutter/material.dart';
import 'package:apna_gadi/widget/navigation_bar.dart' as custom_nav;
import 'package:apna_gadi/widget/search_bar.dart' as custom;
import 'package:apna_gadi/widget/vehicle_card.dart';
import 'package:apna_gadi/models/vehicals.dart';
import 'package:apna_gadi/services/api_service.dart'; // Correct import

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Vehicle>> _featuredVehicles;
  late Future<List<Vehicle>> _searchedVehicles;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _featuredVehicles =
        ApiService().fetchFeaturedVehicles(); // Correct method call
    _searchedVehicles = Future.value([]); // Initialize with an empty list
  }

  void _searchVehicles(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _searchedVehicles =
          ApiService().fetchVehiclesByName(query); // Correct method call
    });
  }

  void _navigateToCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            custom.SearchBar(onChanged: _searchVehicles),
            const SizedBox(height: 20),
            // Featured Vehicles / Search Results
            Text(
              _isSearching ? 'Search Results' : 'Featured Vehicles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Vehicle>>(
                future: _isSearching ? _searchedVehicles : _featuredVehicles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No vehicles available'));
                  } else {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!
                          .map((vehicle) => VehicleCard(vehicle: vehicle))
                          .toList(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            // Categories
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CategoryCard(
                  icon: Icons.directions_car,
                  label: 'Cars',
                  onTap: () => _navigateToCategory('Cars'),
                ),
                _CategoryCard(
                  icon: Icons.motorcycle,
                  label: 'Bikes',
                  onTap: () => _navigateToCategory('Bikes'),
                ),
                _CategoryCard(
                  icon: Icons.directions_bus,
                  label: 'SUVs',
                  onTap: () => _navigateToCategory('SUVs'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: custom_nav.CustomNavigationBar(),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Listings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Showing $category vehicles',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
