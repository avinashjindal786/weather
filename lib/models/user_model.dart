// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? fullName;
  String? profilePic;
  String? email;
  String? userId;

  UserModel({
    this.fullName,
    this.profilePic,
    this.email,
    this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["full_name"],
        profilePic: json["profilePic"],
        email: json["email"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "profilePic": profilePic,
        "email": email,
        "userId": userId,
      };
}
