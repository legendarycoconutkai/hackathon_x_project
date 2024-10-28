import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hackathon_x_project/backend/message.dart';
import 'package:hackathon_x_project/backend/message_provider.dart';
import 'package:hackathon_x_project/backend/event_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

Future<void> analyzeMessagesAndCreateEvent(BuildContext context) async {
  final messages = Provider.of<MessageProvider>(context, listen: false).getAllMessages();

  if (messages.isNotEmpty) {
    // Send messages to Google Gemini for analysis
    final analysisResult = await callGoogleGemini(messages);

    // Find the last image in the messages
    XFile? lastImage;
    for (var message in messages) {
      if (message.image != null) {
        lastImage = message.image;
      }
    }

    DateTime now = DateTime.now();
    String time = DateFormat.jm().format(now);

    // Create a new EventDetail based on the analysis
    final newEvent = EventDetail(
      date: DateTime.now(), // Use the current date or any other logic
      title: analysisResult['title'] ?? 'Default Title',
      time: time,
      description: analysisResult['description'] ?? 'Default Description',
      emoji: null,
      imageFile: lastImage,
    );

    // Add the new EventDetail to the sharedEvents list
    sharedEvents.add(newEvent);

    // Log or set a flag to indicate that the method was run
    log("analyzeMessagesAndCreateEvent was run at $now");
  } else {
    log("No messages to analyze.");
  }
}

Future<Map<String, String?>> callGoogleGemini(List<Message> messages) async {

  String titleText = '';
  String descriptionText = '';

  final model = GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: dotenv.env['GOOGLE_API_KEY']!,
  );

  try {
    final String userInput = Message.convertMessagesToString(messages);

    final titlePrompt = 'You about to read a conversation between a human and an AI. The conversation as such:\n$userInput\n\n Tell me whether this is a what day. Example: Happy Day, Sad Day, Study Day, etc. Just give a definite answer. I do not want a response longer than three words.';
    final titleContent = [Content.text(titlePrompt)];
    final titleResponse = await model.generateContent(titleContent);
    titleText = titleResponse.text!;

    final descriptionPrompt = 'You about to read a conversation between a human and an AI. The conversation as such:\n$userInput\n\n Write a summary of what has happened to the human. You are supposed to help the human to write his or her journal, so you should write it in first-person narration. Do not add in extra content on your own.';
    final descriptionContent = [Content.text(descriptionPrompt)];
    final descriptionResponse = await model.generateContent(descriptionContent);
    descriptionText = descriptionResponse.text!;
  } catch (e) {
      print("Error : $e");
  }

  return {
    'title': titleText,
    'description': descriptionText
  };
}