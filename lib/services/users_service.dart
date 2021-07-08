import 'dart:convert';

import 'package:kanban/models/task.dart';

import 'package:http/http.dart' as http;
import 'package:kanban/services/global_state.dart';

class UsersService {
  Future login(String username, String password) async {
    print({"username": username, "password": password});
    const url = 'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/';
    final response = await http.Client().post(Uri.parse(url),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({"username": username, "password": password}));
    print('login ${response.statusCode}');
    final loginResult =
        LoginResult.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    GlobalState.token = loginResult.token;
    print(GlobalState.token);
  }
}
