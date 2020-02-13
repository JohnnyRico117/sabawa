import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/phase.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/todo_hero.dart';
import 'package:url_launcher/url_launcher.dart';

class ToDoItem extends StatefulWidget {
  final DocumentSnapshot snap;
  final Phase phase;

  ToDoItem(this.snap, this.phase);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  StateModel appState;

  StreamController<int> streamController = new StreamController.broadcast();

//  int _points;

  //bool complete = false;

  final _biggerFont = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    if (streamController != null) {
      streamController.stream.listen((data) {
        // TODO: delete print
        print("DataReceived: " + data.toString());
        setState(() {
          widget.snap.reference.updateData({
            'points': data * 60,
          });
        });
      }, onDone: () {
        // TODO: delete print
        print("Task Done");
      }, onError: (error) {
        // TODO: delete print
        print("Some Error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    final int status = widget.snap.data['status'];
    final int hours = widget.snap.data['hours'];

    String owner = "";

    if (widget.snap.data['owner'] != null) {
      owner = widget.snap.data['owner'];
    }

    final double endDate = widget.snap.data['enddate'].seconds / 3600;
    final double now = new Timestamp.now().seconds / 3600;

    final double hoursLeft = endDate - now;
    final double percent = 1.0 - hoursLeft / (hours * 100.0);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
              leading: Stack(
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned.fill(
                    bottom: 20.0,
                    child: Center(
                      child: Icon(
                        Icons.schedule,
                        color: percent <= 0.5
                            ? Colors.green
                            : percent > 0.5 && percent <= 0.8
                                ? Colors.yellow
                                : Colors.red,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 20.0,
                    child: Center(
                      child: Text(
                        hoursLeft < 0
                            ? _formatTimestampToDay(
                                widget.snap.data['enddate'].toDate())
                            : _formatTimestampToTime(
                                widget.snap.data['enddate'].toDate()),
                        style: TextStyle(
                            color: hoursLeft < 0 ? Colors.red : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
              title: ToDoHero(
                id: widget.snap.documentID,
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder<void>(
                    pageBuilder: ((context, animation, secondaryAnimation) {
                      return Page2(
                          ToDoHero(
                              id: widget.snap.documentID,
                              phase: widget.phase,
                              snap: widget.snap,
                              width: 400.0,
                              check: false,
                              controller: streamController),
                          streamController);
                    }),
                    transitionDuration: Duration(milliseconds: 1000),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 0.2);
                      var end = Offset(0.0, 0.0);
                      var curve = Curves.easeOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                phase: widget.phase,
                snap: widget.snap,
                check: true,
                controller: streamController,
              )
//            title: SizedBox(
//                child: Hero(
//                  tag: "hero-" + widget.snap.documentID,
//                  child: Material(
//                    child: InkWell(
//                      child: Container(
//                        padding: EdgeInsets.all(5.0),
//                        decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(15.0),
//                            color: Color(0x110000FF)),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(
//                                right: 10.0,
//                              ),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 40.0,
//                                    height: 40.0,
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(15.0),
//                                      color: widget.phase != null
//                                          ? Color(widget.phase.color)
//                                          : Colors.white,
//                                      //shape: BoxShape.circle
//                                    ),
//                                  ),
//                                  Positioned.fill(
//                                    bottom: 15.0,
//                                    child: Icon(
//                                      Icons.star,
//                                      color: Colors.black26,
//                                      size: 15.0,
//                                    ),
//                                  ),
//                                  Positioned.fill(
//                                    top: 15.0,
//                                    child: Center(
//                                      child: Text(
//                                        widget.snap.data['points'].toString(),
//                                        style: TextStyle(
//                                          fontSize: 14.0,
//                                          fontWeight: FontWeight.bold,
//                                          color: Colors.black26,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              child: Text(
//                                widget.snap.data['task'],
//                                //softWrap: true,
//                                style: _biggerFont,
//                              ),
//                            ),
//                            PopupMenuButton<StatusAction>(
//                              icon: status == 0
//                                  ? Icon(
//                                      Icons.panorama_fish_eye,
//                                      size: 30.0,
//                                    )
//                                  : status == 1
//                                      ? Icon(
//                                          Icons.check_circle_outline,
//                                          size: 30.0,
//                                          color: Colors.green,
//                                        )
//                                      : status == 2
//                                          ? Icon(
//                                              Icons.check_circle,
//                                              size: 30.0,
//                                              color: Colors.green,
//                                            )
//                                          : status == 3
//                                              ? Icon(
//                                                  Icons.cancel,
//                                                  size: 30.0,
//                                                  color: Colors.red,
//                                                )
//                                              : Icon(Icons.panorama_fish_eye,
//                                                  size: 30.0),
//                              onSelected: (StatusAction result) {
//                                switch (result) {
//                                  case StatusAction.to_do:
//                                    setState(() {
//                                      widget.snap.reference
//                                          .updateData({'status': 0});
//                                    });
//                                    break;
//                                  case StatusAction.done:
//                                    setState(() {
//                                      widget.snap.reference
//                                          .updateData({'status': 1});
//                                    });
//                                    break;
//                                  case StatusAction.approved:
//                                    setState(() {
//                                      widget.snap.reference
//                                          .updateData({'status': 2});
//                                    });
//                                    break;
//                                  case StatusAction.not_approved:
//                                    setState(() {
//                                      widget.snap.reference
//                                          .updateData({'status': 3});
//                                    });
//                                    break;
//                                }
//                              },
//                              itemBuilder: (BuildContext context) =>
//                                  <PopupMenuEntry<StatusAction>>[
//                                PopupMenuItem<StatusAction>(
//                                  value: StatusAction.to_do,
//                                  child: RichText(
//                                    text: TextSpan(
//                                      children: [
//                                        WidgetSpan(
//                                          child: Padding(
//                                            padding:
//                                                EdgeInsets.only(right: 10.0),
//                                            child: Icon(
//                                              Icons.panorama_fish_eye,
//                                            ),
//                                          ),
//                                        ),
//                                        TextSpan(
//                                          style: TextStyle(
//                                            fontWeight: FontWeight.bold,
//                                            color: Colors.black,
//                                            fontSize: 16.0,
//                                          ),
//                                          text: "To-Do",
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                                owner == appState.currentUser.id
//                                    ? PopupMenuItem<StatusAction>(
//                                        value: StatusAction.approved,
//                                        child: RichText(
//                                          text: TextSpan(
//                                            children: [
//                                              WidgetSpan(
//                                                  child: Padding(
//                                                      padding: EdgeInsets.only(
//                                                          right: 10.0),
//                                                      child: Icon(
//                                                        Icons.check_circle,
//                                                        color: Colors.green,
//                                                      ),),),
//                                              TextSpan(
//                                                style: TextStyle(
//                                                  fontWeight: FontWeight.bold,
//                                                  color: Colors.black,
//                                                  fontSize: 16.0,
//                                                ),
//                                                text: "Done",
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      )
//                                    : PopupMenuItem<StatusAction>(
//                                        value: StatusAction.done,
//                                        child: RichText(
//                                          text: TextSpan(
//                                            children: [
//                                              WidgetSpan(
//                                                child: Padding(
//                                                  padding: EdgeInsets.only(
//                                                      right: 10.0),
//                                                  child: Icon(
//                                                    Icons.check_circle_outline,
//                                                    color: Colors.green,
//                                                  ),
//                                                ),
//                                              ),
//                                              TextSpan(
//                                                style: TextStyle(
//                                                  fontWeight: FontWeight.bold,
//                                                  color: Colors.black,
//                                                  fontSize: 16.0,
//                                                ),
//                                                text: "Done & Approved",
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                      onTap: () {
//                        Navigator.of(context).push(_createRoute(widget.snap.documentID));
//                      },
//                    ),
//                  ),
//                ),
//              ),
              ),
        ],
      ),
    );
  }

  String formatTimestamp(DateTime timestamp) {
    var format = new DateFormat('d MMM, hh:mm');
    return format.format(timestamp);
  }

  String _formatTimestampToTime(DateTime timestamp) {
    var format = new DateFormat('hh:mm');
    return format.format(timestamp);
  }

  String _formatTimestampToDay(DateTime timestamp) {
    var format = new DateFormat('d.MM');
    return format.format(timestamp);
  }

  Widget _statusPopUp(int status) {
    return PopupMenuButton<StatusAction>(
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
                      : Icon(Icons.panorama_fish_eye, size: 30.0),
      onSelected: (StatusAction result) {
        switch (result) {
          case StatusAction.to_do:
            setState(() {
              widget.snap.reference.updateData({'status': 0});
            });
            break;
          case StatusAction.done:
            setState(() {
              widget.snap.reference.updateData({'status': 1});
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
              text: TextSpan(children: [
            WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.panorama_fish_eye,
                    ))),
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0,
              ),
              text: "To-Do",
            ),
          ])),
        ),
        PopupMenuItem<StatusAction>(
          value: StatusAction.done,
          child: RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ))),
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0,
              ),
              text: "Done",
            ),
          ])),
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
        switch (result) {
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
              text: TextSpan(children: [
            WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ))),
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0,
              ),
              text: "Edit",
            ),
          ])),
        ),
        PopupMenuItem<EditAction>(
          value: EditAction.assign,
          child: RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.assignment,
                      color: Colors.blue,
                    ))),
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0,
              ),
              text: "Assign",
            ),
          ])),
        ),
        PopupMenuItem<EditAction>(
          value: EditAction.remove,
          child: RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))),
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0,
              ),
              text: "Remove",
            ),
          ])),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Close 2");
    // TODO maybe close
    //streamController.close();
  }

//  Future<bool> _requestPop() {
//    setState(() {
//      complete = false;
//    });
//    return new Future.value(true);
//  }
//
//  void _myFunc() async {
//    await Future.delayed(const Duration(milliseconds: 900), () {
//      setState(() {
//        complete = true;
//      });
//    });
//
//  }
}

enum StatusAction { to_do, done, approved, not_approved }
enum EditAction { edit, remove, assign }

class Page2 extends StatefulWidget {
  final ToDoHero hero;
  final StreamController<int> streamController;

  Page2(this.hero, this.streamController);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  AnimationController controller;
  TextEditingController _hoursController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _linkController = TextEditingController();

  //StreamController<int> streamController = StreamController<int>();

  DateTime date = new DateTime.now();
  DateTime lastMidnight;
  double now = new Timestamp.now().seconds / 3600;
  int hours;
  double endDate;
  double hoursLeft = 0.0;
  double percent = 1.0;

  final _biggerFont = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  String _detail = "No detail info";
  String _link = "No link given";
  double _costs = 0.0;
  int _hours = 0;
  int _status = 0;
  int _difference = 0;

  bool complete = false;
  bool tapped = false;
  bool _edit = false;

  @override
  void initState() {
    super.initState();
    _initController();
    _initData();
    _myFunc();

    lastMidnight = new DateTime(date.year, date.month, date.day);
    _difference = DateTime.fromMillisecondsSinceEpoch(
            widget.hero.snap.data["enddate"].seconds * 1000)
        .difference(lastMidnight)
        .inDays;

    hours = widget.hero.snap.data['hours'];
    endDate = widget.hero.snap.data['enddate'].seconds / 3600;
    now = Timestamp.now().seconds / 3600;

    hoursLeft = endDate - now;
    if (hoursLeft >= 0) {
      percent = 1.0 - hoursLeft / (hours * 100.0);
    }

    if (widget.streamController != null) {
      widget.streamController.stream.listen((data) {
        // TODO: Delete print
        print("DataReceived: " + data.toString());
        if (mounted) {
          //_setPoints(data);
          widget.hero.snap.reference.updateData({
            'points': _hours * 60,
          });
        }
      }, onDone: () {
        // TODO: Delete print
        print("Task Done");
      }, onError: (error) {
        // TODO: Delete print
        print("Some Error");
      });
    }
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WillPopScope(
          child: Scaffold(
            backgroundColor: complete ? Color(0xFF0050a1) : Colors.transparent,
            appBar: complete
                ? AppBar(
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.white),
                    actions: <Widget>[
                      _edit
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _edit = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _deleteAlert();
                              },
                            ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: IconButton(
                          icon: Icon(
                            _edit ? Icons.save : Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_edit) {
                                widget.streamController.add(_hours * 60);
                                widget.hero.snap.reference.updateData({
                                  'hours': _hours,
                                  'points': _hours * 60,
                                  'detail': _detail,
                                  'link': _link,
                                  'costs': _costs,
                                });
                              }
                              _edit = !_edit;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.transparent),
                  ),
            body: Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(15.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  color: Colors.white),
              margin: EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
//                                child: Center(
//                                  child: widget.hero,
//                                )
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  widget.hero,
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
//                              Icon(
//                                Icons.delete,
//                                size: 30.0,
//                                color: Colors.black26,
//                              ),
//                              Container(
//                                height: 30.0,
//                                child: VerticalDivider(
//                                  thickness: 2.0,
//                                  color: Colors.black26,
//                                  //width: 20.0,
//                                ),
//                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.radio_button_unchecked,
                                  size: 30.0,
                                  color: _status == 0
                                      ? Colors.blue
                                      : Colors.black26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.hero.snap.reference
                                        .updateData({'status': 0});
                                    _status = 0;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.check_circle_outline,
                                  size: 30.0,
                                  color: _status == 1
                                      ? Colors.green
                                      : Colors.black26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.hero.snap.reference
                                        .updateData({'status': 1});
                                    _status = 1;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.check_circle,
                                  size: 30.0,
                                  color: _status == 2
                                      ? Colors.green
                                      : Colors.black26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.hero.snap.reference
                                        .updateData({'status': 2});
                                    _status = 2;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 30.0,
                                  color: _status == 3
                                      ? Colors.red
                                      : Colors.black26,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.hero.snap.reference
                                        .updateData({'status': 3});
                                    _status = 3;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          child: LinearPercentIndicator(
                            //width: MediaQuery.of(context).size.width - 250,
                            animation: true,
                            lineHeight: 10.0,
                            animationDuration: 2000,
                            percent: percent,
                            //center: Text("90.0%"),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            //progressColor: Colors.green,
                            linearGradient: percent <= 0.5
                                ? LinearGradient(colors: [
                                    Colors.green,
                                    Colors.green[900],
                                  ])
                                : percent > 0.5 && percent <= 0.8
                                    ? LinearGradient(colors: [
                                        Colors.yellow[200],
                                        Colors.yellow[600]
                                      ])
                                    : LinearGradient(
                                        colors: [Colors.red, Colors.red[900]]),

                            trailing: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Icon(
                                        Icons.today,
                                        //color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _difference < 0
                                          ? Colors.red
                                          //: Colors.black,
                                          : Color(0xFF21BFBD),
                                      fontSize: 16.0,
                                    ),
                                    text: _difference < 0
                                        ? (_difference * -1).toString() +
                                            " days overdue"
                                        : _difference.toString() + " days left",
                                  ),
                                ],
                              ),
                            ),
                            //trailing: Text("31.01.2020"),
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.hourglass_empty),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        5 *
                                        3,
                                    child: _edit
                                        ? TextFormField(
                                            textAlign: TextAlign.end,
                                            controller: _hoursController,
//                                      decoration: InputDecoration(
//                                          border: InputBorder.none),
                                            onChanged: (value) {
                                              setState(() {
                                                _hours = int.parse(value);
                                              });
                                            },
                                          )
                                        : Text(
                                            _hours.toString(),
                                            textAlign: TextAlign.end,
                                          ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text("h"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Divider(
                          height: 14.0,
                          thickness: 2.0,
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.info_outline),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 5 * 3,
                                child: _edit
                                    ? TextFormField(
                                        textAlign: TextAlign.end,
                                        controller: _detailController,
//                                        decoration: InputDecoration(
//                                            border: InputBorder.none),
                                        onChanged: (value) {
                                          print(value);
                                          setState(() {
                                            _detail = value;
                                          });
                                        },
                                      )
                                    : Text(
                                        _detail,
                                        textAlign: TextAlign.end,
                                      ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.link),
                              _edit
                                  ? Container(
                                      width: MediaQuery.of(context).size.width /
                                          5 *
                                          3,
                                      child: TextFormField(
                                        textAlign: TextAlign.end,
                                        controller: _linkController,
//                                        decoration: InputDecoration(
//                                            border: InputBorder.none),
                                        onChanged: (value) {
                                          setState(() {
                                            _link = value;
                                          });
                                        },
                                      ))
                                  : InkWell(
                                      child: Text(
                                        "Link",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue),
                                      ),
                                      onTap: () => launch(_link)),
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.attach_money),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        5 *
                                        3,
                                    child: _edit
                                        ? TextFormField(
                                            textAlign: TextAlign.end,
                                            controller: _costController,
                                            //decoration: InputDecoration(border: InputBorder.none),
                                            onChanged: (value) {
                                              setState(() {
                                                _costs = double.parse(value);
                                              });
                                            },
                                          )
                                        : Text(
                                            _costs.toString(),
                                            textAlign: TextAlign.end,
                                          ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Text("€"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.color_lens),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text("Ideas"),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.color_lens),
                                  Icon(Icons.plus_one)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text("Develop"),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(),
                  complete
                      ? Divider(
                          height: 14.0,
                          thickness: 2.0,
                        )
                      : Container(),
                  complete
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.person_pin),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.amber,
                                  //shape: BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          onWillPop: _requestPop,
        ),
      ],
    );

//    return Stack(
//      children: <Widget>[
//        complete
//            ? WillPopScope(
//                child: Scaffold(
//                    backgroundColor: Color(0xFF0050a1),
//                    appBar: AppBar(
//                      elevation: 0.0,
//                    ),
////                    body: Padding(
////                      padding: EdgeInsets.only(top: 10.0),
////                      child: Container(
////                        decoration: ShapeDecoration(
////                          shape: RoundedRectangleBorder(
////                            borderRadius: BorderRadius.circular(15.0),
////                          ),
////                          color: Colors.white,
////                        ),
////                        child: Center(
////                          child: Text('Page 2'),
////                        ),
////                      ),
////                    ),
//                body: Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 0.0),
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          padding: EdgeInsets.only(
//                              top: 15.0
//                          ),
//                          decoration: ShapeDecoration(
//                            shape: RoundedRectangleBorder(
//                              //borderRadius: BorderRadius.circular(15.0),
//                              borderRadius: BorderRadius.only(
//                                topLeft: Radius.circular(15.0),
//                                topRight: Radius.circular(15.0),
//                              ),
//                            ),
//                            color: Colors.white,
//                          ),
//                          child: SizedBox(
//                            height: 50.0,
//                            width: 300.0,
//                            child: Hero(
//                              tag: "hero-" + widget.documentID,
//                              child: Material(
//                                child: InkWell(
//                                  child: Container(
//                                    padding: EdgeInsets.all(5.0),
//                                    decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(15.0),
//                                        color: Color(0x110000FF)),
//                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.start,
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: EdgeInsets.only(
//                                            right: 10.0,
//                                          ),
//                                          child: Stack(
//                                            children: <Widget>[
//                                              Container(
//                                                width: 40.0,
//                                                height: 40.0,
//                                                decoration: BoxDecoration(
//                                                  borderRadius: BorderRadius.circular(15.0),
//                                                  color: Colors.green,
//                                                  //shape: BoxShape.circle
//                                                ),
//                                              ),
//                                              Positioned.fill(
//                                                bottom: 15.0,
//                                                child: Icon(
//                                                  Icons.star,
//                                                  color: Colors.black26,
//                                                  size: 15.0,
//                                                ),
//                                              ),
//                                              Positioned.fill(
//                                                top: 15.0,
//                                                child: Center(
//                                                  child: Text(
//                                                    "300",
//                                                    style: TextStyle(
//                                                      fontSize: 14.0,
//                                                      fontWeight: FontWeight.bold,
//                                                      color: Colors.black26,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                        Expanded(
//                                          child: Text(
//                                            "Test",
//                                            //softWrap: true,
//                                            style: _biggerFont,
//                                          ),
//                                        ),
//                                        PopupMenuButton<StatusAction>(
//                                          icon: status == 0
//                                              ? Icon(
//                                            Icons.panorama_fish_eye,
//                                            size: 30.0,
//                                          )
//                                              : status == 1
//                                              ? Icon(
//                                            Icons.check_circle_outline,
//                                            size: 30.0,
//                                            color: Colors.green,
//                                          )
//                                              : status == 2
//                                              ? Icon(
//                                            Icons.check_circle,
//                                            size: 30.0,
//                                            color: Colors.green,
//                                          )
//                                              : status == 3
//                                              ? Icon(
//                                            Icons.cancel,
//                                            size: 30.0,
//                                            color: Colors.red,
//                                          )
//                                              : Icon(Icons.panorama_fish_eye,
//                                              size: 30.0),
//                                          onSelected: (StatusAction result) {
//                                            switch (result) {
//                                              case StatusAction.to_do:
//                                                setState(() {
////                                                  widget.snap.reference
////                                                      .updateData({'status': 0});
//                                                });
//                                                break;
//                                              case StatusAction.done:
//                                                setState(() {
////                                                  widget.snap.reference
////                                                      .updateData({'status': 1});
//                                                });
//                                                break;
//                                              case StatusAction.approved:
//                                                setState(() {
////                                                  widget.snap.reference
////                                                      .updateData({'status': 2});
//                                                });
//                                                break;
//                                              case StatusAction.not_approved:
//                                                setState(() {
////                                                  widget.snap.reference
////                                                      .updateData({'status': 3});
//                                                });
//                                                break;
//                                            }
//                                          },
//                                          itemBuilder: (BuildContext context) =>
//                                          <PopupMenuEntry<StatusAction>>[
//                                            PopupMenuItem<StatusAction>(
//                                              value: StatusAction.to_do,
//                                              child: RichText(
//                                                text: TextSpan(
//                                                  children: [
//                                                    WidgetSpan(
//                                                      child: Padding(
//                                                        padding:
//                                                        EdgeInsets.only(right: 10.0),
//                                                        child: Icon(
//                                                          Icons.panorama_fish_eye,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    TextSpan(
//                                                      style: TextStyle(
//                                                        fontWeight: FontWeight.bold,
//                                                        color: Colors.black,
//                                                        fontSize: 16.0,
//                                                      ),
//                                                      text: "To-Do",
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
////                                            owner == appState.currentUser.id
////                                                ? PopupMenuItem<StatusAction>(
////                                              value: StatusAction.approved,
////                                              child: RichText(
////                                                text: TextSpan(
////                                                  children: [
////                                                    WidgetSpan(
////                                                      child: Padding(
////                                                        padding: EdgeInsets.only(
////                                                            right: 10.0),
////                                                        child: Icon(
////                                                          Icons.check_circle,
////                                                          color: Colors.green,
////                                                        ),),),
////                                                    TextSpan(
////                                                      style: TextStyle(
////                                                        fontWeight: FontWeight.bold,
////                                                        color: Colors.black,
////                                                        fontSize: 16.0,
////                                                      ),
////                                                      text: "Done",
////                                                    ),
////                                                  ],
////                                                ),
////                                              ),
////                                            )
////                                                : PopupMenuItem<StatusAction>(
////                                              value: StatusAction.done,
////                                              child: RichText(
////                                                text: TextSpan(
////                                                  children: [
////                                                    WidgetSpan(
////                                                      child: Padding(
////                                                        padding: EdgeInsets.only(
////                                                            right: 10.0),
////                                                        child: Icon(
////                                                          Icons.check_circle_outline,
////                                                          color: Colors.green,
////                                                        ),
////                                                      ),
////                                                    ),
////                                                    TextSpan(
////                                                      style: TextStyle(
////                                                        fontWeight: FontWeight.bold,
////                                                        color: Colors.black,
////                                                        fontSize: 16.0,
////                                                      ),
////                                                      text: "Done & Approved",
////                                                    ),
////                                                  ],
////                                                ),
////                                              ),
////                                            ),
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                ),
//                onWillPop: _requestPop,
//              )
//            : Scaffold(
//                backgroundColor: Colors.transparent,
//                appBar: new AppBar(
//                  backgroundColor: Colors.transparent,
//                  elevation: 0.0,
//                  iconTheme: IconThemeData(color: Colors.transparent),
//                ),
//                body: Padding(
//                  padding: EdgeInsets.only(top: 10.0),
//                  child: Container(
//                    decoration: ShapeDecoration(
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15.0),
//                      ),
//                      color: Colors.white,
//                    ),
//                  ),
//                )),
//      ],
//    );
  }

  void _initData() {
    if (widget.hero.snap.data["detail"] != null) {
      _detail = widget.hero.snap.data["detail"];
    }
    _status = widget.hero.snap.data["status"];
    _hours = widget.hero.snap.data["hours"];

    if (widget.hero.snap.data["costs"] != null) {
      _costs = widget.hero.snap.data["costs"].toDouble();
    }

    if (widget.hero.snap.data["link"] != null) {
      _link = widget.hero.snap.data["link"];
    }
  }

  void _initController() {
    _hoursController.addListener(() {
      String _text = _hoursController.text;
      _hoursController.value = _hoursController.value.copyWith(
        text: _text,
        selection: TextSelection(
          baseOffset: _text.length,
          extentOffset: _text.length,
        ),
      );
    });
    _hoursController.text = widget.hero.snap.data["hours"].toString();

    _detailController.addListener(() {
      String _text = _detailController.text;
      _detailController.value = _detailController.value.copyWith(
        text: _text,
        selection: TextSelection(
          baseOffset: _text.length,
          extentOffset: _text.length,
        ),
      );
    });
    _detailController.text = _detail;

    _linkController.addListener(() {
      String _text = _linkController.text;
      _linkController.value = _linkController.value.copyWith(
        text: _text,
        selection: TextSelection(
          baseOffset: _text.length,
          extentOffset: _text.length,
        ),
      );
    });
    _linkController.text = _link;

    _costController.addListener(() {
      String _text = _costController.text;
      _costController.value = _costController.value.copyWith(
        text: _text,
        selection: TextSelection(
          baseOffset: _text.length,
          extentOffset: _text.length,
        ),
      );
    });
    _costController.text = _costs.toStringAsFixed(2);
  }

  Future<void> _deleteAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you really want to delete this task?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  widget.hero.snap.reference.delete();
                });
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _requestPop() {
    setState(() {
      complete = false;
    });
    return new Future.value(true);
  }

  void _myFunc() async {
    await Future.delayed(const Duration(milliseconds: 900), () {});
    setState(() {
      complete = true;
    });
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressIndicatorDemoState createState() =>
      new _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 0.5).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
    //controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: LinearProgressIndicator(
          value: animation.value,
        ),
      ),
    );
  }
}
