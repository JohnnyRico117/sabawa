import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/utils/enums/card_types.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileCard extends StatefulWidget {

  @override
  _ProfileCardState createState() => _ProfileCardState();

}

class _ProfileCardState extends State<ProfileCard> {

  StateModel appState;

  int _tasks = 0;
  int _allTasks = 0;
  double _percent = 0.0;
  int _points = 0;
  int _allPoints = 0;

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
                    Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: new NetworkImage(appState.user.photoUrl),
                            radius: 40.0,
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
                                    children: <Widget> [
                                      Text(
                                        "Hi, " + appState.user.displayName.split(" ").first,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      )
                                    ]
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      top: 5.0,
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 30.0,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "200",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      )
                                    ],
                                  )
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
//                                                          Icons.assignment,
//                                                          color: Colors.blue,
//                                                        )
//                                                    )
//                                                ),
//                                                TextSpan(
//                                                  style: TextStyle(
//                                                    fontWeight: FontWeight.bold,
//                                                    color: Colors.black,
//                                                    fontSize: 16.0,
//                                                  ),
//                                                  text: "Tasks:",
//                                                ),
//                                              ]
//                                          )
//                                      ),
//                                      Text(
//                                        _tasks.toString(),
//                                        style: TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                          color: Colors.black,
//                                          fontSize: 16.0,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(
//                                      left: 20.0,
//                                      right: 5.0,
//                                      top: 5.0,
//                                      bottom: 5.0
//                                  ),
//                                  child:Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      RichText(
//                                          text: TextSpan(
//                                              children: [
//                                                WidgetSpan(
//                                                    child: Padding(
//                                                        padding: EdgeInsets.only(right: 5.0),
//                                                        child: Icon(
//                                                          Icons.star,
//                                                          color: Colors.yellow,
//                                                          size: 25.0,
//                                                        )
//                                                    )
//                                                ),
//                                                TextSpan(
//                                                  style: TextStyle(
//                                                    fontWeight: FontWeight.bold,
//                                                    color: Colors.black,
//                                                    fontSize: 25.0,
//                                                  ),
//                                                  text: _points.toString(),
//                                                ),
//                                              ]
//                                          )
//                                      ),
//                                    ],
//                                  ),
//                                ),
                              ],
                            ),
                          ),

                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          IconButton(
                              icon: Icon(Icons.people),
                              onPressed: null
                          ),
                          IconButton(
                              icon: Icon(Icons.mail_outline),
                              onPressed: null
                          ),
                          IconButton(
                              icon: Icon(Icons.notifications_none),
                              onPressed: null
                          ),
                          IconButton(
                              icon: Icon(Icons.error),
                              onPressed: null
                          ),
                        ]
                    )


                  ],
                )
            )
        )
    );
  }

  Widget _firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton.icon(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black)),
          onPressed: () {},
          color: Colors.white,
          textColor: Colors.black,
          icon: Icon(Icons.star),
          label: Text("200",
              style: TextStyle(fontSize: 14)),
        ),
        RaisedButton.icon(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black)),
          onPressed: () {},
          color: Colors.white,
          textColor: Colors.black,
          icon: Icon(Icons.mail_outline),
          label: Text("Messages",
              style: TextStyle(fontSize: 14)),
        ),

      ],
    );
  }

  Widget _secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton.icon(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black)),
          onPressed: () {},
          color: Colors.white,
          textColor: Colors.black,
          icon: Icon(Icons.storage),
          label: Text("Phases",
              style: TextStyle(fontSize: 14)),
        ),
        RaisedButton.icon(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black)),
          onPressed: () {},
          color: Colors.white,
          textColor: Colors.black,
          icon: Icon(Icons.list),
          label: Text("To-Do",
              style: TextStyle(fontSize: 14)),
        ),

      ],
    );

  }

  void initData() {

    int _taskCounter = 0;
    int _allTasksCounter = 0;
    int _pointsCounter = 0;
    int _allPointsCounter = 0;

    if (mounted) {
      setState(() {
        _allTasks = _allTasksCounter;
        _tasks = _taskCounter;
        _points = _pointsCounter;
        _allPoints = _allPointsCounter;
        if (_allTasksCounter != 0) {
          _percent = _taskCounter / _allTasksCounter;
        }
      });
    }

  }
}