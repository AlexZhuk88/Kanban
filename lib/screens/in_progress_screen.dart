import 'package:flutter/material.dart';
import 'package:kanban/authentication/bloc/authentication_bloc.dart';
import '../models/task.dart';
import '../services/cards_service.dart';
import '../widgets/card_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InProgressScreen extends StatelessWidget {
  final cardsService = CardsService();
  Widget build(BuildContext context) {
    final token = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.token,
    );

    return FutureBuilder<List<CardItem>>(
      future: cardsService.getCards(token, RowValue.inProgress),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
