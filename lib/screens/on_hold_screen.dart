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
          'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjI1Nzc0NTI4LCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjI1NzcwOTI4fQ.Gv9LJBGM7CvFxFAdsEYT4q98Jiz7uAQYXFwuHIDufwk'
    });
    return parseCards(utf8.decode(response.bodyBytes));
  }

  List<CardItem> parseCards(String responseBody) {
    print('parseCards');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<CardItem>((json) => CardItem.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    print('build OnHoldScreen');
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
