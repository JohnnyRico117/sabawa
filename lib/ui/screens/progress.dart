import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:sabawa/utils/enums/card_types.dart';

//import 'package:sabawa/model/state.dart';
//import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/progress_card.dart';
import 'package:sabawa/ui/widgets/profile_card.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class Progress extends StatefulWidget {

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  //StateModel appState;
  bool _missed = false;

  List<DocumentSnapshot> _snaps = new List();

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    //appState = StateWidget.of(context).state;

    if (_snaps.isEmpty) return LoadingIndicator();

    return new Container(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: <Widget>[
          ProfileCard(),
          !_missed ? Container() : ProgressCard(CardType.MISSED, _snaps),
          ProgressCard(CardType.DAILY, _snaps),
          ProgressCard(CardType.WEEKLY, _snaps),
          ProgressCard(CardType.MONTHLY, _snaps),
          ProgressCard(CardType.PROJECT, _snaps),
        ],
      )
    );
  }

  void initData() async {

    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('projectID');

    if (id != null) {
      bool _temp = false;

      QuerySnapshot querysnaps = await Firestore.instance
          .collection('tasks')
          .where("project", isEqualTo: id)
          .getDocuments();

      for (DocumentSnapshot snap in querysnaps.documents) {
        final double endDate = snap.data['enddate'].seconds / 3600 / 24;
        final double now = new Timestamp.now().seconds / 3600 / 24;

        double diff = now - endDate;

        if (diff < 0) {
          _temp = true;
          break;
        }
      }

      if (mounted) {
        setState(() {
          _missed = _temp;
          _snaps = querysnaps.documents;
        });
      }
    }
  }

}