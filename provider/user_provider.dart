import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/models/user.dart';

class UserProvider extends ChangeNotifier {
  SSB_user _user = SSB_user(
      id: '',
      name: '',
      password: '',
      email: '',
      address: '',
      type: '',
      token: '');

  SSB_user get user => _user;

  void setUser(String user) {
    _user = SSB_user.fromJson(user);
    notifyListeners();
  }
}
