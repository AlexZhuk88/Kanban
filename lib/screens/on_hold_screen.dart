import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kanban/models/task.dart';

import '../widgets/card_task.dart';
import 'package:http/http.dart' as http;

class OnHoldScreen extends StatelessWidget {
  // final _onHoldTasks = DataBase.onHoldCardItems;
  Future<List<CardItem>> getCards(http.Client client) async {
    const url = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/';
    final response = await client.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Authorization':
          'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjI1NzcwNzU3LCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjI1NzY3MTU3fQ.zYw3uidviHmoAW0ZErZpO0puCFctPSe6anTgInOlZeY'
    });
    return parseCards(response.body);
  }

  List<CardItem> parseCards(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardItem>((json) => CardItem.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardItem>>(
      future: getCards(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
