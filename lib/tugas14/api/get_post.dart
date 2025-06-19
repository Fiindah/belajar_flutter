import 'dart:convert';

import 'package:belajar_flutter/tugas14/models/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<PostUsersModel>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => PostUsersModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
