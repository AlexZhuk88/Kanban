import 'package:flutter/material.dart';
import 'package:kanban/authentication/bloc/authentication_bloc.dart';
import 'package:kanban/services/cards_service.dart';
import '../models/task.dart';

import '../widgets/card_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApprovedScreen extends StatelessWidget {
  final cardsService = CardsService();
  Widget build(BuildContext context) {
    final token = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.token,
    );

    return FutureBuilder<List<CardItem>>(
      future: cardsService.getCards(token, RowValue.approved),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CardsList(cards: snapshot.data!)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
