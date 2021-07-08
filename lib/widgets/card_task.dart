import 'package:flutter/material.dart';
import 'package:kanban/models/task.dart';

class CardTask extends StatelessWidget {
  final CardItem task;

  CardTask(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(7),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'id:${task.id}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 3),
            Text(task.text)
          ],
        ),
      ),
    );
  }
}

class CardsList extends StatelessWidget {
  final List<CardItem> cards;

  CardsList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: cards.map((task) {
        return CardTask(task);
      }).toList()),
    );
  }
}
