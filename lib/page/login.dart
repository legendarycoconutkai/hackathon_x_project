import 'dart:developer'; // For logging purposes

import 'package:flutter/material.dart'; // Flutter framework
import 'package:hackathon_x_project/backend/colour.dart'; // Custom color definitions
import 'package:hackathon_x_project/navbar.dart'; // Navigation bar

// LoginPage widget which is a stateful widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// State class for LoginPage
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  final _emailController = TextEditingController(); // Controller for email input
  final _passwordController = TextEditingController(); // Controller for password input

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method to handle form submission
  void _submit() {
    if (_formKey.currentState!.validate()) {
      log('Email: ${_emailController.text}'); // Log email
      log('Password: ${_passwordController.text}'); // Log password
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the form
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the form vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center the form horizontally
              children: [
                Image.asset('assets/gif/happydog.gif'), // Display an image
                TextFormField(
                  controller: _emailController, // Assign email controller
                  decoration: const InputDecoration(
                    labelText: 'Email', // Label for email input
                    icon: Icon(Icons.email), // Icon for email input
                  ),
                  keyboardType: TextInputType.emailAddress, // Email keyboard type
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email'; // Validation for email input
                    }
                    return null;
                  },*/
                ),
                const SizedBox(height: 16), // Space between inputs
                TextFormField(
                  controller: _passwordController, // Assign password controller
                  decoration: const InputDecoration(
                    labelText: 'Password', // Label for password input
                    icon: Icon(Icons.lock), // Icon for password input
                  ),
                  obscureText: true, // Hide password input
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password'; // Validation for password input
                    }
                    return null;
                  },*/
                ),
                const SizedBox(height: 30), // Space before the button
                SizedBox(
                  width: double.infinity, // Button takes full width
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Frame()), // Navigate to Frame widget
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tertiary, // Custom background color
                      shape: const StadiumBorder(), // Button shape
                      padding: const EdgeInsets.symmetric(vertical: 16), // Button padding
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black), // Button text style
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Main function to run the app
void main() {
  runApp(const MaterialApp(
    home: LoginPage(), // Set LoginPage as the home widget
  ));
}