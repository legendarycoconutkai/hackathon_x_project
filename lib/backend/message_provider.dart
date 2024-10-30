import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/message.dart';

/// A provider class for managing messages with state management.
class MessageProvider with ChangeNotifier {
  // A private list to store messages.
  final List<Message> _messages = [];

  /// A getter to retrieve the list of messages.
  List<Message> get messages => _messages;

  /// Adds a new message to the list and notifies listeners.
  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  /// Clears all messages from the list and notifies listeners.
  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  /// Returns an unmodifiable view of all messages.
  List<Message> getAllMessages() {
    return List.unmodifiable(_messages);
  }
}