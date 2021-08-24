import 'package:flutter/material.dart';
import 'package:my_app/http/request.dart';

class Register with ChangeNotifier {
  Requests requests = Requests();
  void register({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) {
    requests.postUser(
        phone: phone, name: name, email: email, password: password);
  }
}
