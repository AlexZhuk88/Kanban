import 'dart:convert';

import 'package:kanban/models/task.dart';

import 'package:http/http.dart' as http;
import 'package:kanban/services/global_state.dart';

class CardsService {
  Future<List<CardItem>> getCards() async {
    const url = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/';
    final response = await http.Client().get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Authorization': 'JWT ${GlobalState.token}'
    });
    return _parseCards(utf8.decode(response.bodyBytes));
  }

  List<CardItem> _parseCards(String responseBody) {
    print('parseCards');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardItem>((json) => CardItem.fromJson(json)).toList();
  }
}
