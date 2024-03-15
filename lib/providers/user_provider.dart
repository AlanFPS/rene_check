import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
      id: '1',
      name: 'John Doe',
      email: 'johndoe@example.com',
      profilePictureUrl: 'url',
      isIdVerified: false,
      isPhoneVerified: false);

  User get user => _user;

  void updateUser(User user) {
    _user = user;
    notifyListeners();
  }
}
