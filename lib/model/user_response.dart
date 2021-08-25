// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        required this.phone,
        required this.name,
        required this.password,
        required this.email,
        required this.id,
    });

    String phone;
    String name;
    String password;
    String email;
    String id;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        phone: json["phone"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
        "password": password,
        "email": email,
        "id": id,
    };
}
