import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/model/user_response.dart';

class Requests {
  var url = "https://611b5f2b22020a00175a443a.mockapi.io/User";

  Future<List<UserResponse>> getUser() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<UserResponse> users =
          body.map((dynamic item) => UserResponse.fromJson(item)).toList();
      print(users.length);

      return users;
    } else {
      throw "Can't get ";
    }
  }

  postUser({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) async {
    var response = await http.post(Uri.parse(url), body: {
      "phone": phone,
      "name": name,
      "password": password,
      "email": email,
    });
    print(response.body);
  }
}
