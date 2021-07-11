import 'dart:convert';

import 'package:kanban/models/task.dart';

import 'package:http/http.dart' as http;

class UsersService {
  Future<String> login(String username, String password) async {
    const url = 'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/';
    final response = await http.Client().post(Uri.parse(url),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({"username": username, "password": password}));
    final loginResult =
        LoginResult.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return loginResult.token;
  }
}
