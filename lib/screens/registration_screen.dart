import 'package:flutter/material.dart';
import 'package:apna_gadi/screens/login_screen.dart'; // Import your login screen

class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _register(BuildContext context) {
    // Implement your registration logic here
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Example logic: check if passwords match and are not empty
    if (password == confirmPassword &&
        username.isNotEmpty &&
        password.isNotEmpty) {
      // Simulating successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // Show error message if registration fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Failed'),
          content: Text('Please make sure all fields are filled correctly.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevents resizing when keyboard appears
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Here!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // Username input field
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Password input field
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Confirm Password input field
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Register button
              ElevatedButton(
                onPressed: () => _register(context),
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
