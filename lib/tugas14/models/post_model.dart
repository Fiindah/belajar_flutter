// To parse this JSON data, do
//
//     final postUsersModel = postUsersModelFromJson(jsonString);

import 'dart:convert';

List<PostUsersModel> postUsersModelFromJson(String str) =>
    List<PostUsersModel>.from(
      json.decode(str).map((x) => PostUsersModel.fromJson(x)),
    );

String postUsersModelToJson(List<PostUsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostUsersModel {
  int userId;
  int id;
  String title;
  String body;

  PostUsersModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostUsersModel.fromJson(Map<String, dynamic> json) => PostUsersModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
