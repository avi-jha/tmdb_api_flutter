// To parse this JSON data, do
//
//     final usernameModel = usernameModelFromJson(jsonString);

import 'dart:convert';

UsernameModel usernameModelFromJson(String str) => UsernameModel.fromJson(json.decode(str));

String usernameModelToJson(UsernameModel data) => json.encode(data.toJson());

class UsernameModel {
  UsernameModel({
    this.username,
    this.key,
  });

  String username;
  dynamic key;

  factory UsernameModel.fromJson(Map<String, dynamic> json) => UsernameModel(
    username: json["username"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "key": key,
  };
}
