import 'package:flutter/material.dart';
import '../widgets/card_task.dart';

class InProgressScreen extends StatelessWidget {
  final _onHoldTasks = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Column(
              children: _onHoldTasks.map((task) {
        return CardTask(task);
      }).toList())),
    );
  }
}
