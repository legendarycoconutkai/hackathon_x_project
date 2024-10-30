import 'package:image_picker/image_picker.dart';

// dart file to store user information
class UserInfo {
  static final UserInfo _instance = UserInfo._internal();

  String? _name = '';
  String? _email = '';
  String? _phoneNo = '';
  String? _password = '';
  XFile? _image;

  factory UserInfo() {
    return _instance;
  }

  UserInfo._internal();

  // Getters
  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get password => _password;
  XFile? get image => _image;

  // Setters
  set name(String? name) {
    _name = name;
  }

  set email(String? email) {
    _email = email;
  }

  set phoneNo(String? phoneNo) {
    _phoneNo = phoneNo;
  }

  set password(String? password) {
    _password = password;
  }

  set image(XFile? image) {
    _image = image;
  }

  // Method to update all fields
  void updateUserInfo({String? name, String? email, String? phoneNo, String? password, XFile? image}) {
    _name = name;
    _email = email;
    _phoneNo = phoneNo;
    _password = password;
    _image = image;
  }

  String? getName() => _name;
  String? getEmail() => _email;
  String? getPhoneNo() => _phoneNo;
  String? getPassword() => _password;
  XFile? getImage() => _image;
}