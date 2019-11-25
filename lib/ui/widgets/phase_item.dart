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

  bool expand;

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 12.0);
  final _boldFont = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);


  final String phase_name = "To Do";
  final int tasks = 5;
  final int alltasks = 20;
  final int hours = 120;
  final int points = 120;
  final Timestamp now = new Timestamp.now();

  // TODO: Percent: Number of tasks and number of tasks which are done
  final double percent = 0.5;

  @override
  void initState() {
    super.initState();
    expand = false;
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;


    //final int tasks = widget.snap.data['tasks'];
    //final int hours = widget.snap.data['hours'];

    //final double enddate = widget.snap.data['enddate'].seconds / 3600;
    //final double now = new Timestamp.now().seconds / 3600;

    //final double hours_left = enddate - now;
    //final double percent =  1.0 - hours_left / (hours * 100.0);



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
                percent <= 0.5 ? Color(0x332E7D32) : // Light green
                percent > 0.5 && percent <= 0.8 ? Color(0x44FFEB3B) : // Light yellow
                Color(0x33B71C1C), // Light red
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
                        decoration: BoxDecoration(
                            color: Color(0xFF4FC3F7),
                            shape: BoxShape.circle
                        ),
                      ),
                      Positioned.fill(
                          child: Center(
                            child: Text(points.toString(), style: _boldFont),
                          )
                      )
                    ]
                ),
                title: Text(
                    phase_name,
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
                            "200/3000",
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
                            "200/3000",
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
                                              Icons.error,
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
                                      text: "Missed:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            "0",
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
                                              color: Colors.grey,
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
                            "24.12.2020",
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
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AddTask(widget.snap.documentID, appState.currentProjectID)),
                                );
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



  Card detailView() {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            Text(phase_name),
            Text(tasks.toString() + "/" + alltasks.toString()),
            Text(hours.toString()),


          ],
        ),
      )
    );
  }

  String formatTimestamp(DateTime timestamp) {
    var format = new DateFormat('d MMM, hh:mm a');
    return format.format(timestamp);
  }

}