import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/screens/vhs_detail.dart';

class VHSToDoItem extends StatefulWidget {
  final DocumentSnapshot snap;
  final Function(int) updatePoints;

  VHSToDoItem({this.snap, this.updatePoints});

  @override
  _VHSToDoItemState createState() => _VHSToDoItemState();
}

class _VHSToDoItemState extends State<VHSToDoItem> {
  StateModel appState;

  bool expired;

  @override
  void initState() {
    super.initState();
    expired = false;
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    final int status = widget.snap.data['status'];
    final int hours = widget.snap.data['hours'];
    final String task = widget.snap.data['task'];
    final int task_length = task.length;

    String owner = "";

    if (widget.snap.data['owner'] != null) {
      owner = widget.snap.data['owner'];
    }

    final double endDate = widget.snap.data['enddate'].seconds / 3600;
    final double now = new Timestamp.now().seconds / 3600;

    expired = now > endDate;

    final double hoursLeft = endDate - now;
    final double percent = 1.0 - hoursLeft / (hours * 100.0);

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Container(
          width: 329,
          height: 64,
          decoration: new BoxDecoration(
              color: Color(0xff3f3f3f),
              border: Border.all(color: Color(0xff707070), width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  status == 0
                      ? GestureDetector(
                          child: Image.asset(
                            "assets/check.png",
                            width: 30,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertDialog(
                                      title: Text(
                                        "Great!!!",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff432d2d),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/trophy_512.png",
                                            height: 100.0,
                                            width: 100.0,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/nav/star.png",
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  "+" +
                                                      widget.snap.data['points']
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff432d2d),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/nav/gold.png",
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  "+" +
                                                      widget.snap.data['points']
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xff432d2d),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Oops, Undo!"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            print("Oops");
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Nice"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            updateStatus();
                                            print("Nice");
                                          },
                                        ),
                                      ],
                                      elevation: 20.0,
                                    ));
                          },
                        )
                      : GestureDetector(
                          child: Image.asset(
                            "assets/checked.png",
                            width: 30,
                          ),
                          onTap: () {
                            setState(() {
                              setState(() {
                                widget.snap.reference.updateData({'status': 0});
                              });
                            });
                          },
                        ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Container(
                        width: 24,
                        height: 25,
                        decoration:
                            new BoxDecoration(color: Color(0xff393838))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Container(
                  width: 276,
                  height: 52,
                  decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      border: Border.all(color: Color(0xff707070), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: EdgeInsets.only(left: 7.0, right: 7.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              padding: new EdgeInsets.only(right: 13.0),
                              child: Text(task,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: expired
                                        ? Colors.red
                                        : Color(0xff432d2d),
                                    fontSize:
                                        task_length > 17 && task_length < 20
                                            ? 22
                                            : task_length > 20 ? 18 : 26,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                          ),
                        ],
                      )

//
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VHSDetail(widget.snap)),
        );
      },
    );
  }

  void updateStatus() {
    final DocumentReference postRef =
        Firestore.instance.collection('users').document(appState.user.uid);
    Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(postRef);
      if (postSnapshot.exists) {
        await tx.update(postRef, <String, dynamic>{
          'points': FieldValue.increment(widget.snap.data['points']),
          'coins': FieldValue.increment(widget.snap.data['points']),
        });
      }
    });

    setState(() {
      widget.snap.reference.updateData({'status': 1});
    });

    widget.updatePoints(widget.snap.data['points']);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
