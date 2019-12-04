import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/screens/add/add_task.dart';

class PhaseItem extends StatefulWidget {

  final DocumentSnapshot snap;

  PhaseItem(this.snap);

  @override
  _PhaseItemState createState() => _PhaseItemState();

}

class _PhaseItemState extends State<PhaseItem> {

  StateModel appState;

  bool expand = false;

  final _biggerFont = const TextStyle(fontSize: 18.0);
  // TODO: Remove
  //final _smallerFont = const TextStyle(fontSize: 12.0);
  //final _boldFont = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  int allTasks = 0;
  int doneTasks = 0;
  int allPoints = 0;
  int reachedPoints = 0;
  double percent = 0.0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Card(
        color: Colors.white,
        elevation: 10.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [percent, percent],
              colors: [
                percent <= 0.5 ?  Color(0x33B71C1C) :
                percent > 0.5 && percent <= 0.8 ? Color(0x44FFEB3B) :
                Color(0x332E7D32),
                Colors.white
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Stack(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Color(widget.snap.data['color']),
                            shape: BoxShape.circle
                        ),
                      ),
//                      Positioned.fill(
//                          child: Center(
//                            child: Text(points.toString(), style: _boldFont),
//                          )
//                      )
                    ]
                ),
                title: Text(
                    widget.snap.data['name'],
                    style: _biggerFont
                ),
                trailing: IconButton(
                    icon: Icon(expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    onPressed: () {
                      setState(() {
                        expand = !expand;
                      });
                    }
                ),
              ),
              expand ? Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5.0,
                          bottom: 5.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Padding(
                                            padding: EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.assignment,
                                              color: Colors.blue,
                                            )
                                        )
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                        wordSpacing: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                      text: "Tasks:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            doneTasks.toString() + "/" + allTasks.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5.0,
                          bottom: 5.0
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Padding(
                                            padding: EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            )
                                        )
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                        wordSpacing: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                      text: "Points:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            reachedPoints.toString() + "/" + allPoints.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5.0,
                          bottom: 5.0
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: Padding(
                                            padding: EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              Icons.timer,
                                              color: Colors.red,
                                            )
                                        )
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                        wordSpacing: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                      text: "Deadline:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            formatTimestamp(widget.snap.data['enddate'].toDate()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 5.0,
                          bottom: 5.0
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.blue,
                              ),
                              iconSize: 50.0,
                              onPressed: () async {
                                await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AddTask(widget.snap.documentID, appState.currentProjectID)),
                                );

                                await Future.delayed(const Duration(seconds: 1), (){});
                                _initDataAfterPop();
                              },
                          ),
                          Text(
                            "Add task",
                            //formatTimestamp(widget.snap.data['enddate'].toDate()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ) : Container(),
            ],
          ),
        )
    );
  }

  String formatTimestamp(DateTime timestamp) {
    var format = new DateFormat('d MMM, hh:mm');
    return format.format(timestamp);
  }

  void initData() async {

    List<String> _tasks = new List();
    int _doneTasks = 0;
    int _allPoints = 0;
    int _reachedPoints = 0;
    double _percent = 0.0;

    if (widget.snap.data['tasks'] != null) {
      _tasks = new List<String>.from(widget.snap.data['tasks']);

      for (String id in _tasks) {
        DocumentSnapshot querySnapshot = await Firestore.instance
            .collection('tasks')
            .document(id)
            .get();
        if (querySnapshot.exists) {
          _allPoints += querySnapshot['points'];
          if(querySnapshot['done'] == true) {
            _doneTasks++;
            _reachedPoints += querySnapshot['points'];
          }
        }
      }
      _percent = _doneTasks / _tasks.length;
    }

    if(mounted) {
      setState(() {
        allTasks = _tasks.length;
        doneTasks = _doneTasks;
        allPoints = _allPoints;
        reachedPoints = _reachedPoints;
        percent = _percent;
      });
    }

  }

  void _initDataAfterPop() async {

    DocumentSnapshot snap = await Firestore.instance
        .collection('phases')
        .document(widget.snap.documentID)
        .get();

    if (snap.exists) {

      List<String> _tasks = new List();
      int _doneTasks = 0;
      int _allPoints = 0;
      int _reachedPoints = 0;

      _tasks = new List<String>.from(snap.data['tasks']);
      for (String id in _tasks) {
        DocumentSnapshot querySnapshot = await Firestore.instance
            .collection('tasks')
            .document(id)
            .get();
        if (querySnapshot.exists) {
          _allPoints += querySnapshot['points'];
          if(querySnapshot['done'] == true) {
            _doneTasks++;
            _reachedPoints += querySnapshot['points'];
          }
        }
      }

      double _percent = _doneTasks / _tasks.length;

      if(mounted) {
        setState(() {
          allTasks = _tasks.length;
          doneTasks = _doneTasks;
          allPoints = _allPoints;
          reachedPoints = _reachedPoints;
          percent = _percent;
        });
      }
    }

  }

}