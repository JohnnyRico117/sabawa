import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';
import 'package:sabawa/ui/screens/add/add_project.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  StateModel appState;



  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: new StreamBuilder(
                stream: Firestore.instance.collection('projects').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return LoadingIndicator();
                  return new ListView(
                    children: snapshot.data.documents
                        .where((d) => appState.currentUser.projects != null && appState.currentUser.projects.contains(d.documentID))
                        .map((document) {
                      return _buildProject(document);
                    }).toList(),
                  );
                },
              ),
            ),
            ListTile(
              leading: new FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProject()),
                    );
                  },
                  child: Icon(Icons.add)
              ),
              title: new Text("New Project"),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildProject(DocumentSnapshot document) {
    return ListTile(
      leading: Icon(Icons.group_work),
      title: Text(document['name']),
      trailing:
          document.documentID == appState.currentProjectID ?
            IconButton(
                icon: Icon(Icons.check_circle, color: Colors.green,),
                //onPressed: () => _setProject(document.documentID)
            ) :
            IconButton(
                icon: Icon(Icons.check_circle_outline),
                onPressed: () => _setProject(document.documentID, document['name'])
            )
    );
  }

  void _setProject(String id, String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('projectID', id);
    setState(() {
      appState.currentProjectID = id;
      appState.currentProjectName = name;
    });
  }

}