import 'package:flutter/material.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/progress_card.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return new Container(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: <Widget>[
          ProgressCard("Daily Progress"),
          ProgressCard("Weekly Progress"),
          ProgressCard("Monthly Progress"),
          ProgressCard("Project Progress"),
        ],
      )
    );
  }

}