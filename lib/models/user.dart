// lib/models/user.dart

class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  // Method to convert User object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  // Method to create a User object from a map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
    );
  }
}
