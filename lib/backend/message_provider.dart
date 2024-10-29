import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/message.dart';

class MessageProvider with ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  List<Message> getAllMessages() {
    return List.unmodifiable(_messages);
  }
}