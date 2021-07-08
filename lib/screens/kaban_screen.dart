import 'package:flutter/material.dart';
import 'package:kanban/screens/approved_screen.dart';
import 'package:kanban/screens/in_progress_screen.dart';
import 'package:kanban/screens/needs_review_screen.dart';
import 'package:kanban/screens/on_hold_screen.dart';

class KabanScreen extends StatefulWidget {
  @override
  _KabanScreenState createState() => _KabanScreenState();
}

class _KabanScreenState extends State<KabanScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'On hold',
              ),
              Tab(
                text: 'In progress',
              ),
              Tab(
                text: 'Needs review',
              ),
              Tab(
                text: 'Approved',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            OnHoldScreen(),
            InProgressScreen(),
            NeedsReviewScreen(),
            ApprovedScreen()
          ],
        ),
      ),
    );
  }
}
