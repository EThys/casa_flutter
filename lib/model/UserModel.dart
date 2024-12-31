// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String ? username;
  String ? password;
  String ? email;
  int ? userTypeId;

  UserModel({
    this.username,
    this.password,
    this.email,
    this.userTypeId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    password: json["password"],
    email: json["email"],
    userTypeId: json["user_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "user_type_id": userTypeId,
  };
}
