import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/phase.dart';
import 'package:sabawa/state_widget.dart';

class ToDoItem extends StatefulWidget {

  final DocumentSnapshot snap;
  final Phase phase;

  ToDoItem(this.snap, this.phase);

  @override
  _ToDoItemState createState() => _ToDoItemState();

}

class _ToDoItemState extends State<ToDoItem> {

  StateModel appState;

  bool _expand = false;

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 12.0);
  final _boldFont = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    final int status = widget.snap.data['status'];
    final int hours = widget.snap.data['hours'];

    final double endDate = widget.snap.data['enddate'].seconds / 3600;
    final double now = new Timestamp.now().seconds / 3600;

    final double hoursLeft = endDate - now;
    final double percent =  1.0 - hoursLeft / (hours * 100.0);

    return Card(
      color: Colors.white,
      elevation: 5.0,
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
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: widget.phase != null ? Color(widget.phase.color) : Colors.white,
                            shape: BoxShape.circle
                        ),
                      ),
                      Positioned.fill(
                          child: Center(
                            child: Text(widget.snap.data['points'].toString(), style: _boldFont),
                          )
                      )
                    ]
                ),
                title: Text(
                    widget.snap.data['task'],
                    style: _biggerFont
                ),
                subtitle: Text(
                    formatTimestamp(widget.snap.data['enddate'].toDate()),
                    style: _smallerFont
                ),
                trailing: IconButton(
                    icon: Icon(_expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    onPressed: () {
                      setState(() {
                        _expand = !_expand;
                      });
                    }
                ),
              ),
              _expand ? Container(
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
                                      text: "Detail:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            widget.snap.data['detail'] == null ? '' : widget.snap.data['detail'].toString(),
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
                                              Icons.attach_money,
                                              color: Colors.green,
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
                                      text: "Costs:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            widget.snap.data['costs'] == null ? '0' : widget.snap.data['costs'].toString(),
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
                                              Icons.link,
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
                                      text: "Link:",
                                    ),
                                  ]
                              )
                          ),
                          Text(
                            widget.snap.data['link'] == null ? '' : widget.snap.data['link'].toString(),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Edit",
                            //formatTimestamp(widget.snap.data['enddate'].toDate()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          _editPopUp(),
//                          IconButton(
//                            icon: Icon(
//                              Icons.edit,
//                            ),
//                            iconSize: 35.0,
//                            onPressed: () async {
////                              await Navigator.push(context,
////                                MaterialPageRoute(builder: (context) => AddTask(widget.snap.documentID, appState.currentProjectID)),
////                              );
////
////                              await Future.delayed(const Duration(seconds: 1), (){});
////                              _initDataAfterPop();
//                            },
//                          ),
                          Text(
                            "Status",
                            //formatTimestamp(widget.snap.data['enddate'].toDate()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                          _statusPopUp(status),
//                          IconButton(
//                            icon: Icon(
//                              Icons.panorama_fish_eye,
//                            ),
//                            iconSize: 35.0,
//                            onPressed: () async {
////                              await Navigator.push(context,
////                                MaterialPageRoute(builder: (context) => AddTask(widget.snap.documentID, appState.currentProjectID)),
////                              );
////
////                              await Future.delayed(const Duration(seconds: 1), (){});
////                              _initDataAfterPop();
//                            },
//                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ) : Container(),
            ],
          )
        )
    );
  }

  String formatTimestamp(DateTime timestamp) {
    var format = new DateFormat('d MMM, hh:mm');
    return format.format(timestamp);
  }

  Widget _statusPopUp(int status) {
    return PopupMenuButton<StatusAction>(
      icon:
      status == 0 ? Icon(Icons.panorama_fish_eye, size: 30.0,) :
      status == 1 ? Icon(Icons.check_circle_outline, size: 30.0, color: Colors.green,) :
      status == 2 ? Icon(Icons.check_circle, size: 30.0, color: Colors.green,) :
      status == 3 ? Icon(Icons.cancel, size: 30.0, color: Colors.red,) :
      Icon(Icons.panorama_fish_eye, size: 30.0),
      onSelected: (StatusAction result) {

        switch(result) {
          case StatusAction.to_do:
            setState(() {
              widget.snap.reference.updateData({
                'status': 0
              });
            });
            break;
          case StatusAction.done:
            setState(() {
              widget.snap.reference.updateData({
                'status': 1
              });
            });
            break;
          case StatusAction.approved:
            print("Approved");
            break;
          case StatusAction.not_approved:
            print("Pending");
            break;

        }

//              setState(() {
//                _selection = result;
//              });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<StatusAction>>[
        PopupMenuItem<StatusAction>(
          value: StatusAction.to_do,
          child: RichText(
              text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.panorama_fish_eye,
                            )
                        )
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      text: "To-Do",
                    ),
                  ]
              )
          ),
        ),
        PopupMenuItem<StatusAction>(
          value: StatusAction.done,
          child: RichText(
              text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            )
                        )
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      text: "Done",
                    ),
                  ]
              )
          ),
        ),
//                  PopupMenuItem<ToDoAction>(
//                    value: ToDoAction.not_done,
//                    child: RichText(
//                        text: TextSpan(
//                            children: [
//                              WidgetSpan(
//                                  child: Padding(
//                                      padding: EdgeInsets.only(right: 10.0),
//                                      child: Icon(
//                                        Icons.cancel,
//                                        color: Colors.red,
//                                      )
//                                  )
//                              ),
//                              TextSpan(
//                                style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black,
//                                  fontSize: 16.0,
//                                ),
//                                text: "Not done",
//                              ),
//                            ]
//                        )
//                    ),
//                  ),
//                  PopupMenuItem<ToDoAction>(
//                    value: ToDoAction.remove,
//                    child: RichText(
//                        text: TextSpan(
//                            children: [
//                              WidgetSpan(
//                                  child: Padding(
//                                      padding: EdgeInsets.only(right: 10.0),
//                                      child: Icon(
//                                        Icons.delete,
//                                        color: Colors.red,
//                                      )
//                                  )
//                              ),
//                              TextSpan(
//                                style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black,
//                                  fontSize: 16.0,
//                                ),
//                                text: "Remove",
//                              ),
//                            ]
//                        )
//                    ),
//                  ),
      ],
    );
  }

  Widget _editPopUp() {
    return PopupMenuButton<EditAction>(
      icon: Icon(Icons.edit, size: 30.0),
      onSelected: (EditAction result) {

        switch(result) {
          case EditAction.edit:
            print("Edit");
            break;
          case EditAction.remove:
            print("Remove");
            break;
          case EditAction.assign:
            print("Assign");
            break;
        }

      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<EditAction>>[
        PopupMenuItem<EditAction>(
          value: EditAction.edit,
          child: RichText(
              text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.edit,
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
                      text: "Edit",
                    ),
                  ]
              )
          ),
        ),
        PopupMenuItem<EditAction>(
          value: EditAction.assign,
          child: RichText(
              text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
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
                      text: "Assign",
                    ),
                  ]
              )
          ),
        ),
        PopupMenuItem<EditAction>(
          value: EditAction.remove,
          child: RichText(
              text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )
                        )
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      text: "Remove",
                    ),
                  ]
              )
          ),
        ),
//                  PopupMenuItem<ToDoAction>(
//                    value: ToDoAction.remove,
//                    child: RichText(
//                        text: TextSpan(
//                            children: [
//                              WidgetSpan(
//                                  child: Padding(
//                                      padding: EdgeInsets.only(right: 10.0),
//                                      child: Icon(
//                                        Icons.delete,
//                                        color: Colors.red,
//                                      )
//                                  )
//                              ),
//                              TextSpan(
//                                style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black,
//                                  fontSize: 16.0,
//                                ),
//                                text: "Remove",
//                              ),
//                            ]
//                        )
//                    ),
//                  ),
      ],
    );
  }

}

enum StatusAction { to_do, done, approved, not_approved }
enum EditAction { edit, remove, assign }