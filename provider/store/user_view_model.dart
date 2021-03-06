import 'package:flutter/material.dart';
import '../model/user_info.dart';

class UserViewModel extends ChangeNotifier {
  UserInfo _user;

  UserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}