import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/time_item.dart';


class TimeItemList extends StatefulWidget {

  final Function(int) onSelected;

  TimeItemList({this.onSelected});

  @override
  _TimeItemListState createState() => _TimeItemListState();
}

class _TimeItemListState extends State<TimeItemList> {
  StateModel appState;
  DateTime date = new DateTime.now();
  DateTime lastMidnight;
  double _percent;
  bool deadlines = false;

  List<TimeItem> _items = new List();

  @override
  void initState() {
    super.initState();
    // TODO: Get rid of all deadline related
    //_items.add(new TimeItem(selected: false, deadline: true, date: date));
    _items.add(new TimeItem(selected: true, deadline: false, date: date));
    for (int i = 1; i < 7; i++) {
      _items.add(new TimeItem(selected: false, deadline: false, date: date.add(new Duration(days: i))));
    }

    lastMidnight = new DateTime(date.year, date.month, date.day);
    initDeadlineBool();


    // TODO: percent
    _percent = 0.4;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
          left: 15.0
      ),
      itemBuilder: _timeItem,
      itemCount: _items.length,
    );
  }

  Widget _timeItem(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: _items[index].selected ? Colors.white : _items[index].deadline ? Color(0xFFAA2224) : Color(0xFF002972),
          ),
          width: _items[index].selected ? 100.0 : 60.0,
          child: _items[index].selected
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            // TODO: delete DUE
                            _items[index].deadline ? "DUE" : formatDate(_items[index].date),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: _items[index].deadline ? Colors.red : Colors.black
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: _items[index].deadline ? Icon(Icons.info_outline, color: Colors.red,)
                          : Text(
                            formatDay(_items[index].date),
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      progressColor: Colors.green,
                      radius: 40.0,
                      percent: _percent,
                      lineWidth: 5.0,
                      center: Text(
                        (_percent * 100).round().toString() + "%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            _items[index].deadline ? "DUE" : formatDate(_items[index].date),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: _items[index].deadline ? Colors.black : Color(0xFF0050a1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: _items[index].deadline ? Icon(Icons.info_outline, color: Colors.black,)
                          : Text(
                            formatDay(_items[index].date),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF0050a1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
      onTap: () {
        setState(() {
          for (TimeItem item in _items) {
            if (item.selected) {
              item.selected = false;
            }
          }
          _items[index].selected = true;
        });
        widget.onSelected(index);
      },
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('E').format(date).toUpperCase();
  }

  String formatDay(DateTime date) {
    return DateFormat('d').format(date);
  }

  void initDeadlineBool() async {

    final prefs = await SharedPreferences.getInstance();

    QuerySnapshot querySnaps = await Firestore.instance
        .collection('tasks')
        .where("project", isEqualTo: prefs.getString('projectID'))
        .getDocuments();

    List<DocumentSnapshot> snaps = querySnaps.documents;

    for (int i = 0; i < snaps.length; i++) {
      if (DateTime.fromMillisecondsSinceEpoch(snaps[i].data["enddate"].seconds * 1000).difference(lastMidnight).inDays < 0) {
        setState(() {
          deadlines = true;
        });
        break;
      }
    }
  }

//  void click() {
//    setState(() {
//      widget.selected = false;
//    });
//  }
}
