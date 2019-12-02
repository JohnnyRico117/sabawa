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

    final double enddate = widget.snap.data['enddate'].seconds / 3600;
    final double now = new Timestamp.now().seconds / 3600;

    final double hours_left = enddate - now;
    final double percent =  1.0 - hours_left / (hours * 100.0);

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
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Stack(
                    children: <Widget>[
                      Container(
                        width: 50.0,
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
                    icon: Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      print("Click");
                    }),
              )
            ],
          ),
        )
    );

//    return ListTile(
//      title: Row(
//        children: [
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(
//                  widget.snap.data['task'],
//                  style: _biggerFont,
//                ),
//                Container(
//                  padding: const EdgeInsets.only(top: 3),
//                  child: Text(
//                    formatTimestamp(widget.snap.data['date'].toDate()),
//                    style: _smallerFont,
//                  ),
//                )
//
//              ],
//
//            ),
//          ),
//          Icon(
//            Icons.star,
//            color: Colors.yellow,
//          ),
//          Text(widget.snap.data['points'].toString()),
//        ],
//      ),
//
//      trailing: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          status == 0 ? new IconButton(
//              icon: Icon(Icons.check_circle_outline),
//              onPressed: () {
//                setState(() {
//                  widget.snap.reference.updateData({
//                    'Status': 1
//                  });
//                });
//              }) :
//          status == 1 ? new IconButton(
//              icon: Icon(Icons.check_circle_outline, color: Colors.green),
//              onPressed: () {
//                setState(() {
//                  widget.snap.reference.updateData({
//                    'Status': 0
//                  });
//                });
//              }) :
//          new IconButton(
//              icon: Icon(Icons.check_circle, color: Colors.green),
//              onPressed: null
//          )
//
////          new IconButton(
////              icon:
////              status == 1 ? Icon(Icons.check_circle_outline, color: Colors.green) :
////              status == 2 ? Icon(Icons.check_circle, color: Colors.green) :
////              Icon(Icons.check_circle_outline),
////              onPressed: () {
////                setState(() {
////                  if (status == 0) {
////                    widget.snap.reference.updateData({
////                      'Status': 1
////                    });
////                  } else {
////                    widget.snap.reference.updateData({
////                      'Status': 0
////                    });
////                  }
////                });
////              }
////          ),
//        ],
//      ),
//      onTap: () {
//        print("TAP");
//      },
//    );
  }

  String formatTimestamp(DateTime timestamp) {
    var format = new DateFormat('d MMM, hh:mm');
    return format.format(timestamp);
  }

}