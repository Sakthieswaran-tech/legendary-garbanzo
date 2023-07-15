import 'package:ecommproject/models/user_model.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      id: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
