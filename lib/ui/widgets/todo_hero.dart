import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/phase.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class ToDoHero extends StatefulWidget {

  //final String taskID;
  //final String projectID;

  final String id;
  final VoidCallback onTap;
  final double width;
  final DocumentSnapshot snap;
  final Phase phase;
  final bool check;

  ToDoHero({ Key key, this.id, this.onTap, this.width, this.snap, this.phase, this.check }) : super(key: key);

  @override
  _ToDoHeroState createState() => _ToDoHeroState();
}

class _ToDoHeroState extends State<ToDoHero> {
  //const ToDoHero({ Key key, this.id, this.onTap, this.width, this.snap, this.phase }) : super(key: key);

//  final String id;
//  final VoidCallback onTap;
//  final double width;
//  final DocumentSnapshot snap;
//  final Phase phase;

  StateModel appState;


  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    int status = widget.snap.data['status'];
    String owner = "";

    if (widget.snap.data['owner'] != null) {
      owner = widget.snap.data['owner'];
    }

    final _biggerFont = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
      width: widget.width,
      child: Hero(
        tag: widget.id,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0x110000FF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: widget.phase != null
                                ? Color(widget.phase.color)
                                : Colors.white,
                            //shape: BoxShape.circle
                          ),
                        ),
                        Positioned.fill(
                          bottom: 15.0,
                          child: Icon(
                            Icons.star,
                            color: Colors.black26,
                            size: 15.0,
                          ),
                        ),
                        Positioned.fill(
                          top: 15.0,
                          child: Center(
                            child: Text(
                              widget.snap.data['points'].toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.snap.data['task'],
                      //softWrap: true,
                      style: _biggerFont,
                    ),
                  ),
                  widget.check ? PopupMenuButton<StatusAction>(
                    icon: status == 0
                        ? Icon(
                      Icons.panorama_fish_eye,
                      size: 30.0,
                    )
                        : status == 1
                        ? Icon(
                      Icons.check_circle_outline,
                      size: 30.0,
                      color: Colors.green,
                    )
                        : status == 2
                        ? Icon(
                      Icons.check_circle,
                      size: 30.0,
                      color: Colors.green,
                    )
                        : status == 3
                        ? Icon(
                      Icons.cancel,
                      size: 30.0,
                      color: Colors.red,
                    )
                        : Icon(Icons.panorama_fish_eye,
                        size: 30.0),
                    onSelected: (StatusAction result) {
                      switch (result) {
                        case StatusAction.to_do:
                          setState(() {
                            widget.snap.reference
                                .updateData({'status': 0});
                          });
                          break;
                        case StatusAction.done:
                          setState(() {
                            widget.snap.reference
                                .updateData({'status': 1});
                          });
                          break;
                        case StatusAction.approved:
                          setState(() {
                            widget.snap.reference
                                .updateData({'status': 2});
                          });
                          break;
                        case StatusAction.not_approved:
                          setState(() {
                            widget.snap.reference
                                .updateData({'status': 3});
                          });
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<StatusAction>>[
                      PopupMenuItem<StatusAction>(
                        value: StatusAction.to_do,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.panorama_fish_eye,
                                  ),
                                ),
                              ),
                              TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                text: "To-Do",
                              ),
                            ],
                          ),
                        ),
                      ),
                      owner == appState.currentUser.id
                          ? PopupMenuItem<StatusAction>(
                        value: StatusAction.approved,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 10.0),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),),),
                              TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                text: "Done & Approved",
                              ),
                            ],
                          ),
                        ),
                      )
                          : PopupMenuItem<StatusAction>(
                        value: StatusAction.done,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 10.0),
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                text: "Done",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum StatusAction { to_do, done, approved, not_approved }