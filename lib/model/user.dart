import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  int level;
  int points;
  int coins;
  int dailygoal;
  List<String> friends;
  List<String> projects;

  User({
    this.id,
    this.level,
    this.points,
    this.coins,
    this.dailygoal,
    this.friends,
    this.projects
  });

  User.fromSnap(DocumentSnapshot snap)
      : this(
      id: snap.data.containsKey('id') ? snap.data['id'] : '',
      level: snap.data.containsKey('level') ? snap.data['level'] : 1,
      points: snap.data.containsKey('points') ? snap.data['points'] : 0,
      coins: snap.data.containsKey('coins') ? snap.data['coins'] : 0,
      dailygoal: snap.data.containsKey('daily_goal') ? snap.data['daily_goal'] : 0,
      friends: (snap.data.containsKey('friends') && snap.data['friends'] is List) ? new List<String>.from(snap.data['friends']) : null,
      projects: (snap.data.containsKey('projects') && snap.data['projects'] is List) ? new List<String>.from(snap.data['projects']) : null,
  );
}