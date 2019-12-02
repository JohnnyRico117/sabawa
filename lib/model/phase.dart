import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Phase {
  String id;
  String name;
  int color;
  String projectID;
  Timestamp enddate;
  List<String> tasks;

  Phase({
    this.id,
    this.name,
    this.color,
    this.projectID,
    this.enddate,
    this.tasks
  });

  Phase.fromSnap(DocumentSnapshot snap)
      : this(
    id: snap.documentID,
    name: snap.data.containsKey('name') ? snap.data['name'] : '',
    color: snap.data.containsKey('color') ? snap.data['color'] : 0,
    projectID: snap.data.containsKey('projectID') ? snap.data['projectID'] : '',
    enddate: snap.data.containsKey('enddate') ? snap.data['enddate'] : null,
    tasks: (snap.data.containsKey('tasks') && snap.data['tasks'] is List) ? new List<String>.from(snap.data['tasks']) : null,
  );
}