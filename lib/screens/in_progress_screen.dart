import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/cards_service.dart';
import '../widgets/card_task.dart';

class InProgressScreen extends StatelessWidget {
  final cardsService = CardsService();
  Widget build(BuildContext context) {
    print('build OnHoldScreen');
    return FutureBuilder<List<CardItem>>(
      future: cardsService.getCards(RowValue.inProgress),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
