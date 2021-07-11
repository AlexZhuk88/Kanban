import 'dart:convert';

import 'package:kanban/models/task.dart';

import 'package:http/http.dart' as http;

class CardsService {
  Future<List<CardItem>> getCards(String token, String row) async {
    var url = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/?row=$row';
    final response = await http.Client().get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Authorization': 'JWT $token'
    });
    return _parseCards(utf8.decode(response.bodyBytes));
  }

  List<CardItem> _parseCards(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CardItem>((json) => CardItem.fromJson(json)).toList();
  }
}
