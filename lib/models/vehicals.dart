// Define the Vehicle class
class Vehicle {
  final String id;
  final String name;
  final String type; // e.g., Car, Bike, SUV
  final String imageUrl;
  final double price;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.price,
  });

  // Factory constructor to create a Vehicle from JSON
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  // Method to convert Vehicle to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
