import 'package:flutter/material.dart';
import 'package:kanban/models/task.dart';
import 'package:kanban/services/cards_service.dart';

import '../widgets/card_task.dart';

class OnHoldScreen extends StatelessWidget {
  // final _onHoldTasks = DataBase.onHoldCardItems;
  final cardsService = CardsService();
  @override
  Widget build(BuildContext context) {
    print('build OnHoldScreen');
    return FutureBuilder<List<CardItem>>(
      future: cardsService.getCards(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
