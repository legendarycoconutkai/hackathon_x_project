import 'package:image_picker/image_picker.dart';

// dart class for managing messages
class Message {
  final String text;
  final bool isUser;
  final XFile? image;
  
  Message({
    required this.text,
    required this.isUser,
    this.image
  });

  @override
  String toString() {
    return '${isUser ? 'User: ' : 'AI: '}$text\n\n';
  }

  static String convertMessagesToString(List<Message> messages) {
    return messages.map((message) => message.toString()).join();
  }
}