import 'package:flutter/material.dart';
import 'package:my_app/http/request.dart';
import 'package:my_app/model/user/user_response.dart';

class Login with ChangeNotifier {
  Requests requests = Requests();
  late List<UserResponse> users;
  late UserResponse user;
  bool isCheck = false;
  void submitLogin(String email, String password) {
    requests.getUser().then((value) => users = value);
    checkUser(email, password);
    print(isCheck);
    notifyListeners();
    print(email + password);
  }

  void checkUser(String email, String password) {
    for (var i = 0; i < users.length - 1; i++) {
      if (email == users[i].email && password == users[i].password) {
        user = users[i];
        isCheck = true;
      }
    }
  }
}
