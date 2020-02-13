class TimeItem {
  bool selected;
  bool deadline;
  DateTime date;

  TimeItem({
    this.selected,
    this.deadline,
    this.date,
  });

//  User.fromSnap(DocumentSnapshot snap)
//      : this(
//    id: snap.data.containsKey('id') ? snap.data['id'] : '',
//    points: snap.data.containsKey('points') ? snap.data['points'] : '',
//    friends: (snap.data.containsKey('friends') && snap.data['friends'] is List) ? new List<String>.from(snap.data['friends']) : null,
//    projects: (snap.data.containsKey('projects') && snap.data['projects'] is List) ? new List<String>.from(snap.data['projects']) : null,
//  );
}