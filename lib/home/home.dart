import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/authentication/bloc/authentication_bloc.dart';
import 'package:kanban/screens/approved_screen.dart';
import 'package:kanban/screens/in_progress_screen.dart';
import 'package:kanban/screens/needs_review_screen.dart';
import 'package:kanban/screens/on_hold_screen.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
          ),
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
