import 'package:image_picker/image_picker.dart';

class Message {
  final String text;
  final bool isUser;
  final XFile? image;
  
  Message({
    required this.text,
    required this.isUser,
    this.image
  });
}