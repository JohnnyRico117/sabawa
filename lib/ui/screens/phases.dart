import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/phase_item.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

import 'package:sabawa/ui/screens/add/add_phase.dart';

class Phases extends StatefulWidget {

  @override
  _PhasesState createState() => _PhasesState();
}

class _PhasesState extends State<Phases> {

  StateModel appState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: new StreamBuilder(
                stream: Firestore.instance.collection('phases').where("projectID", isEqualTo: appState.currentProjectID).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return LoadingIndicator();
//                return ListView.builder(
//                  padding: const EdgeInsets.all(16.0),
//                  //itemExtent: 80.0,
//                  itemCount: snapshot.data.documents.length,
//                  itemBuilder: (context, i) {
//                    return PhaseItem(snapshot.data.documents[i]);
//                  }
//                );
                  snapshot.data.documents.sort((a, b) => a['position'].compareTo(b['position']));

                  return new ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: snapshot.data.documents
                        .map((document) {
                      return PhaseItem(document);
                    }).toList(),
                  );
                },
              ),
            ),
//            ListTile(
//              leading: new FloatingActionButton(
//                  onPressed: () {
//                    Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => AddPhase()),
//                    );
//                  },
//                  child: Icon(Icons.add)
//              ),
//              title: new Text("New Phase"),
//            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPhase()),
            );
          },
          child: Icon(Icons.add)
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}