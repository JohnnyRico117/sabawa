import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:sabawa/ui/screens/points.dart';
import 'package:sabawa/ui/screens/achievements.dart';

import 'package:sabawa/ui/widgets/vhs_todo_item.dart';

import 'package:sabawa/ui/shapes/triangle_clipper.dart';

import 'package:sabawa/ui/screens/add/add_task.dart';

import 'package:sabawa/ui/widgets/points_appbar.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/phase.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/todo_item.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class ToDoTabController extends StatefulWidget {
  const ToDoTabController({Key key}) : super(key: key);

  @override
  _ToDoTabControllerState createState() => _ToDoTabControllerState();
}

class _ToDoTabControllerState extends State<ToDoTabController>
    with SingleTickerProviderStateMixin {
  StateModel appState;

  FirebaseUser user;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'TODAY'),
    Tab(text: 'WEEK'),
    Tab(text: 'ALLTIME'),
  ];

  TabController _tabController;

  //DateTime date = new DateTime.now();
  //DateTime lastMidnight;
  List<DocumentSnapshot> expiredTasks;

  @override
  void initState() {
    super.initState();
    //user = Provider.of<FirebaseUser>(context, listen: false);
    //calculateIfDeadlineReached();

    _tabController = TabController(vsync: this, length: myTabs.length);
    //lastMidnight = new DateTime(date.year, date.month, date.day);
    expiredTasks = new List<DocumentSnapshot>();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Image.asset(
                "assets/goal.png",
                width: 25.0,
              ),
            ),
            Text(
              appState.currentUser.level.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 5.0),
              child: Image.asset(
                "assets/nav/star.png",
                width: 25.0,
              ),
            ),
            Text(
              appState.currentUser.points.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 5.0),
              child: Image.asset(
                "assets/nav/gold.png",
                width: 25.0,
              ),
            ),
            Text(
              appState.currentUser.coins.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF432d2d),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 17.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
          tabs: myTabs,
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: today(),
                ),
                Positioned.fill(
                  bottom: 0.0,
                  child: Container(
                    height: 100.0,
                    child: rainbow(),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: week(),
                ),
                Positioned.fill(
                  bottom: 0.0,
                  child: Container(
                    height: 100.0,
                    child: rainbow(),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: all(),
                ),
                Positioned.fill(
                  bottom: 0.0,
                  child: Container(
                    height: 100.0,
                    child: rainbow(),
                  ),
                ),
              ],
            ),
          ],
//        children: myTabs.map((Tab tab) {
//          final String label = tab.text.toLowerCase();
//          return Center(
//            child: Text(
//              'This is the $label tab',
//              style: const TextStyle(fontSize: 36),
//            ),
//          );
//        }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfff3f2dd),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTask()));
            print("TEST");
          }),
    );
  }

//  Widget expired() {
//        return Container(
//          padding: EdgeInsets.only(top: 10.0),
//          child: ListView(
//            padding: EdgeInsets.only(bottom: 0.0),
//            children: expiredTasks
//                .map((document) {
//              return VHSToDoItem(
//                snap: document,
//                updatePoints: (value) {
//                  setState(() {
//                    appState.currentUser.points += value;
//                    appState.currentUser.coins += value;
//                  });
//                },
//              );
//            }).toList(),
//          ),
//        );
//  }

  Widget today() {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('tasks')
          //.where("project", isEqualTo: appState.currentProjectID)
          .where("owner", isEqualTo: appState.currentUser.id)
          .orderBy("enddate", descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return LoadingIndicator();

//        snapshot.data.documents.sort((a, b) => a['points']
//                  .toString()
//                  .compareTo(b['points'].toString()));

//          switch (_sortBy) {
//            case 'Alphabet':
//              snapshot.data.documents.sort((a, b) => a['task']
//                  .toString()
//                  .toLowerCase()
//                  .compareTo(b['task'].toString().toLowerCase()));
//              break;
//            case 'Points':
//              snapshot.data.documents
//                  .sort((a, b) => a['points'].compareTo(b['points']));
//              break;
//            case 'Date':
//              snapshot.data.documents.sort((a, b) => a['enddate']
//                  .toString()
//                  .compareTo(b['enddate'].toString()));
//              break;
//            default:
//              snapshot.data.documents.sort((a, b) =>
//                  a['task'].toString().compareTo(b['task'].toString()));
//              break;
//          }

        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100.0),
            children: snapshot.data.documents
                .where((d) =>
                    d.data['status'] != 1 && calculateDaysUntilDeadline(d) <= 0)
                .map((document) {
              return VHSToDoItem(
                snap: document,
                updatePoints: (value) {
                  setState(() {
                    appState.currentUser.points += value;
                    appState.currentUser.coins += value;
                  });
                },
              );
            }).toList(),
          ),
        );

//          if (_phaseFilter.isEmpty) {
//            return new ListView(
//              children: snapshot.data.documents.map((document) {
//                Phase pha;
//                Iterable<Phase> ps =
//                _phases.where((p) => p.id == document.data['phase']);
//                if (ps.isNotEmpty) {
//                  pha = ps.first;
//                }
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          } else {
//            return new ListView(
//              children: snapshot.data.documents
//                  .where((d) => _phaseFilter.contains(d.data['phase']))
//                  .map((document) {
//                Phase pha = _phases
//                    .where((p) => p.id == document.data['phase'])
//                    .first;
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          }
      },
    );
  }

  Widget week() {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('tasks')
      //.where("project", isEqualTo: appState.currentProjectID)
          .where("owner", isEqualTo: appState.currentUser.id)
          .orderBy("enddate", descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return LoadingIndicator();

        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100.0),
            children: snapshot.data.documents
                .where((d) =>
            d.data['status'] != 1 && calculateDaysUntilDeadline(d) < 7)
                .map((document) {
              return VHSToDoItem(
                snap: document,
                updatePoints: (value) {
                  setState(() {
                    appState.currentUser.points += value;
                    appState.currentUser.coins += value;
                  });
                },
              );
            }).toList(),
          ),
        );

//          if (_phaseFilter.isEmpty) {
//            return new ListView(
//              children: snapshot.data.documents.map((document) {
//                Phase pha;
//                Iterable<Phase> ps =
//                _phases.where((p) => p.id == document.data['phase']);
//                if (ps.isNotEmpty) {
//                  pha = ps.first;
//                }
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          } else {
//            return new ListView(
//              children: snapshot.data.documents
//                  .where((d) => _phaseFilter.contains(d.data['phase']))
//                  .map((document) {
//                Phase pha = _phases
//                    .where((p) => p.id == document.data['phase'])
//                    .first;
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          }
      },
    );
  }

  Widget all() {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('tasks')
      //.where("project", isEqualTo: appState.currentProjectID)
          .where("owner", isEqualTo: appState.currentUser.id)
          .orderBy("enddate", descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return LoadingIndicator();


        return Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100.0),
            children: snapshot.data.documents
                .where((d) =>
            d.data['status'] != 1)
                .map((document) {
              return VHSToDoItem(
                snap: document,
                updatePoints: (value) {
                  setState(() {
                    appState.currentUser.points += value;
                    appState.currentUser.coins += value;
                  });
                },
              );
            }).toList(),
          ),
        );

//          if (_phaseFilter.isEmpty) {
//            return new ListView(
//              children: snapshot.data.documents.map((document) {
//                Phase pha;
//                Iterable<Phase> ps =
//                _phases.where((p) => p.id == document.data['phase']);
//                if (ps.isNotEmpty) {
//                  pha = ps.first;
//                }
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          } else {
//            return new ListView(
//              children: snapshot.data.documents
//                  .where((d) => _phaseFilter.contains(d.data['phase']))
//                  .map((document) {
//                Phase pha = _phases
//                    .where((p) => p.id == document.data['phase'])
//                    .first;
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          }
      },
    );
  }

  int calculateDaysUntilDeadline(DocumentSnapshot snap) {
    DateTime date = new DateTime.now();
    DateTime lastMidnight = new DateTime(date.year, date.month, date.day);

    return DateTime.fromMillisecondsSinceEpoch(
            snap.data["enddate"].seconds * 1000)
        .difference(lastMidnight)
        .inDays;
  }
//
//  void calculateIfDeadlineReached() {
//    Firestore.instance
//        .collection('tasks')
//        .where("owner", isEqualTo: user.uid)
//        .snapshots()
//        .listen((snapshot) {
//      snapshot.documents.forEach(checkIfExpired);
//    });
//  }

  void checkIfExpired(DocumentSnapshot snap) {
    DateTime date = new DateTime.now();
    DateTime lastMidnight = new DateTime(date.year, date.month, date.day);

    List<DocumentSnapshot> tasks = new List();

    if (DateTime.fromMillisecondsSinceEpoch(snap.data["enddate"].seconds * 1000)
            .difference(lastMidnight)
            .inDays <
        0) {
      tasks.add(snap);
      setState(() {
        expiredTasks = tasks;
      });
    }
  }

  Widget rainbow() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.215,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFEC612),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFCA318),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.185,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFE781B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFB431C),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.155,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF71518),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFEC0672),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.125,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFC81B9B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF9B269B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.095,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF6B2B9B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF333099),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF1B4AA2),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF046FB5),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.035,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF0094CC),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF03A6DD),
            ),
          ),
        ),
      ],
    );
  }
}
