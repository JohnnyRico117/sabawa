import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  String name;
  String owner;
  Timestamp enddate;
  List<String> phases;

  Project({
    this.id,
    this.name,
    this.owner,
    this.enddate,
    this.phases
  });

  Project.fromSnap(DocumentSnapshot snap)
      : this(
    id: snap.documentID,
    name: snap.data.containsKey('name') ? snap.data['name'] : '',
    owner: snap.data.containsKey('owner') ? snap.data['owner'] : '',
    enddate: snap.data.containsKey('enddate') ? snap.data['enddate'] : null,
    phases: (snap.data.containsKey('phases') && snap.data['phases'] is List) ? new List<String>.from(snap.data['phases']) : null,
  );
}