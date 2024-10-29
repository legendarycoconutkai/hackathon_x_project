// user_info.dart

class UserInfo {
  static final UserInfo _instance = UserInfo._internal();

  String? _name;
  String? _email;
  String? _phoneNo;
  String? _password;

  factory UserInfo() {
    return _instance;
  }

  UserInfo._internal();

  // Getters
  String? get name => _name;
  String? get email => _email;
  String? get phoneNo => _phoneNo;
  String? get password => _password;

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

  // Method to update all fields
  void updateUserInfo({String? name, String? email, String? phoneNo, String? password}) {
    _name = name;
    _email = email;
    _phoneNo = phoneNo;
    _password = password;
  }
}