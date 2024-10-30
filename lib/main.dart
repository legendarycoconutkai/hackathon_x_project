import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon_x_project/backend/colour.dart';
import 'package:hackathon_x_project/backend/message_provider.dart';
import 'package:hackathon_x_project/page/onboardingscreen.dart';
import 'package:provider/provider.dart';

// The main function is the entry point of the application.
void main() async {
  // Load environment variables from the .env file.
  await dotenv.load(fileName: ".env");

  // Run the Flutter application.
  runApp(
    ChangeNotifierProvider(
      // Create an instance of MessageProvider.
      create: (context) => MessageProvider(),
      // Pass MyApp as the child widget.
      child: const MyApp(),
    ),
  );
}

// MyApp is the root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build the widget tree for the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the theme for the application.
      theme: ThemeData(
        scaffoldBackgroundColor: background,
      ),
      // Set the home screen of the application.
      home: const OnboardingScreen(),
    );
  }
}
