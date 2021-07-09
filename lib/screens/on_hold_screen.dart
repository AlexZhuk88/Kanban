import 'package:flutter/material.dart';
import 'package:kanban/models/task.dart';
import 'package:kanban/services/cards_service.dart';

import '../widgets/card_task.dart';

class OnHoldScreen extends StatelessWidget {
  final cardsService = CardsService();
  Widget build(BuildContext context) {
    print('build OnHoldScreen');
    return FutureBuilder<List<CardItem>>(
      future: cardsService.getCards(RowValue.onHold),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          print('OnHoldScreen snapshot.hasError: ${snapshot.error}');

        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
