import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  int points;
  List<String> friends;

  User({
    this.id,
    this.points,
    this.friends,
  });

  User.fromSnap(DocumentSnapshot snap)
      : this(
      id: snap.data.containsKey('id') ? snap.data['id'] : '',
      points: snap.data.containsKey('points') ? snap.data['points'] : '',
      friends: (snap.data.containsKey('friends') && snap.data['friends'] is List) ? new List<String>.from(snap.data['friends']) : null,
  );

}