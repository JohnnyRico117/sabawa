import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/utils/enums/card_types.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatefulWidget {

  final CardType type;
  final List<DocumentSnapshot> snaps;

  ProgressCard(this.type, this.snaps);

  @override
  _ProgressCardState createState() => _ProgressCardState();

}

class _ProgressCardState extends State<ProgressCard> {

  StateModel appState;

  int _tasks = 0;
  int _alltasks = 0;
  double _percent = 0.0;
  int _points = 0;
  int _allpoints = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }


  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Card(
        child: Container(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                            widget.type == CardType.MISSED ? "MISSED DEADLINES" :
                            widget.type == CardType.DAILY ? "Daily Progress" :
                            widget.type == CardType.WEEKLY ? "Weekly Progress" :
                            widget.type == CardType.MONTHLY ? "Monthly Progress" :
                            widget.type == CardType.PROJECT ? "Project Process" :
                            "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        )
                    ),
                    Row(
                        children: <Widget>[
                          widget.type == CardType.MISSED ? Icon(
                            Icons.error,
                            size: 70.0,
                            color: Colors.red,
                          ) :
                          CircularPercentIndicator(
                            progressColor: Colors.green,
                            radius: 70.0,
                            percent: _percent,
                            lineWidth: 10.0,
                            center: Text((_percent * 100).round().toString() + "%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                  text: widget.type == CardType.MISSED ? "Missed Tasks:" : "Tasks:",
                                                ),
                                              ]
                                          )
                                      ),
                                      Text(
                                        widget.type == CardType.MISSED ? _alltasks.toString() :
                                        _tasks.toString() + "/" + _alltasks.toString(),
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
                                      right: 5.0,
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
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                  text: widget.type == CardType.MISSED ? "Missed Points:" : "Points:",
                                                ),
                                              ]
                                          )
                                      ),
                                      Text(
                                        widget.type == CardType.MISSED ? _allpoints.toString() :
                                        _points.toString() + "/" + _allpoints.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(
//                                      left: 20.0,
//                                      right: 5.0,
//                                      top: 5.0,
//                                      bottom: 5.0
//                                  ),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      RichText(
//                                          text: TextSpan(
//                                              children: [
//                                                WidgetSpan(
//                                                    child: Padding(
//                                                        padding: EdgeInsets.only(right: 5.0),
//                                                        child: Icon(
//                                                          Icons.error,
//                                                          color: Colors.red,
//                                                        )
//                                                    )
//                                                ),
//                                                TextSpan(
//                                                  style: TextStyle(
//                                                    wordSpacing: 20.0,
//                                                    fontWeight: FontWeight.bold,
//                                                    color: Colors.black,
//                                                    fontSize: 16.0,
//                                                  ),
//                                                  text: "Missed:",
//                                                ),
//                                              ]
//                                          )
//                                      ),
//                                      Text(
//                                        "0",
//                                        style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          color: Colors.black,
//                                          fontSize: 16.0,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
                              ],
                            ),
                          ),
                        ]
                    )
                  ],
                )
            )
        )
    );
  }

  void initData() {

    int _taskCounter = 0;
    int _allTasksCounter = 0;
    int _pointsCounter = 0;
    int _allPointsCounter = 0;

    for (DocumentSnapshot snap in widget.snaps) {
      final double enddate = snap.data['enddate'].seconds / 3600 / 24;
      final double now = new Timestamp.now().seconds / 3600 / 24;
      double diff = now - enddate;

      switch (widget.type) {
        case CardType.MISSED:
          if (diff < 0) {
            _allTasksCounter++;
            _allPointsCounter += snap.data['points'];
          }
          break;
        case CardType.DAILY:
          if (diff >= 0 && diff < 1) {
            _allTasksCounter++;
            _allPointsCounter += snap.data['points'];
            if (snap.data['done']) {
              _taskCounter++;
              _pointsCounter += snap.data['points'];
            }
          }
          break;
        case CardType.WEEKLY:
          if (diff >= 1 && diff < 7) {
            _allTasksCounter++;
            _allPointsCounter += snap.data['points'];
            if (snap.data['done']) {
              _taskCounter++;
              _pointsCounter += snap.data['points'];
            }
          }
          break;
        case CardType.MONTHLY:
          if (diff >= 7 && diff < 30) {
            _allTasksCounter++;
            _allPointsCounter += snap.data['points'];
            if (snap.data['done']) {
              _taskCounter++;
              _pointsCounter += snap.data['points'];
            }
          }
          break;
        case CardType.PROJECT:
          _allTasksCounter++;
          _allPointsCounter += snap.data['points'];
          if (snap.data['done']) {
            _taskCounter++;
            _pointsCounter += snap.data['points'];
          }
          break;
      }

      if (mounted) {
        setState(() {
          _alltasks = _allTasksCounter;
          _tasks = _taskCounter;
          _points = _pointsCounter;
          _allpoints = _allPointsCounter;
          if (_allTasksCounter != 0) {
            _percent = _taskCounter / _allTasksCounter;
            print(_percent.toString());
          }
        });
      }
    }
  }
}