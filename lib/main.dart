import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackathon_x_project/backend/message_provider.dart';
import 'package:hackathon_x_project/navbar.dart';
import 'package:provider/provider.dart';

void main() async {

  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Frame(),
    );
  }
}
