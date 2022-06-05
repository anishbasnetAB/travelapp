// To parse this JSON data, do
//
//     final apiUser = apiUserFromJson(jsonString);

import 'dart:convert';

List<ApiUser> apiUserFromJson(String str) =>
    List<ApiUser>.from(json.decode(str).map((x) => ApiUser.fromJson(x)));

String apiUserToJson(List<ApiUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiUser {
  ApiUser({
    required this.accessToken,
    required this.firstName,
    required this.email,
    required this.lastName,
    required this.username,
  });

  String accessToken;
  String firstName;
  String email;
  String lastName;
  String username;

  factory ApiUser.fromJson(Map<String, dynamic> json) => ApiUser(
        accessToken: json["access_token"],
        firstName: json["first_name"],
        email: json["email"],
        lastName: json["last_name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "first_name": firstName,
        "email": email,
        "last_name": lastName,
        "username": username,
      };
}
