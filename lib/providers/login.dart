import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/request.dart';
import 'package:my_app/model/user_response.dart';

class Login with ChangeNotifier {
  Requests requests = Requests();
  late List<UserResponse> users;
  late UserResponse user;
  String notification = "Sign in fail";
  void submitLogin(String email, String password) async {
    await requests.getUser().then((value) => users = value);
    checkUser(email, password);
    notifyListeners();
  }

  void checkUser(String email, String password) {
    for (var i = 0; i < users.length - 1; i++) {
      if (email == users[i].email && password == users[i].password) {
        user = users[i];
        notification = "Sign in successful";
      }
    }
  }
}
