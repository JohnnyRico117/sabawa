import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class AddTask extends StatefulWidget {
  //final String phaseID;
  //final String projectID;

  //AddTask(this.phaseID, this.projectID);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  StateModel appState;

  final _formKey = GlobalKey<FormState>();

  String _task = '';
  String _detail = '';
  String _link = '';
  Timestamp _date;
  String _hours;
  String _costs = '0';

  String _phase;
  String _followUpPhase;
  List<String> _phases;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  var txt = new TextEditingController();
  DateFormat format = new DateFormat("dd.MM.yyyy 'at' hh:mm");

  @override
  void initState() {
    super.initState();
    //initDropdown();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD A NEW TASK",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: Color(0xFF432d2d),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: new ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  //autofocus: true,
                  decoration: new InputDecoration(
                      hintText: 'Enter something to do...',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      contentPadding: const EdgeInsets.all(16.0)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter something to do';
                    } else {
                      setState(() {
                        _task = value;
                      });
                      return null;
                    }
                  },
                ),
                TextFormField(
                    //autofocus: true,
                    decoration: new InputDecoration(
                      hintText: 'Enter more detailed information... (optional)',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                    maxLines: 4,
                    onChanged: (value) {
                      setState(() {
                        _detail = value;
                      });
                    }
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter something to do';
//                    } else {
//                      setState(() {
//                        _task = value;
//                      });
//                      return null;
//                    }
//                  },
                    ),
//                TextFormField(
//                    autofocus: true,
//                    decoration: new InputDecoration(
//                        hintText: 'Enter link... (optional)',
//                        contentPadding: const EdgeInsets.all(16.0)
//                    ),
//                    onChanged: (value) {
//                      setState(() {
//                        _link = value;
//                      });
//                    }
//                ),
                TextFormField(
                  decoration: new InputDecoration(
                      hintText: 'Enter working hours...',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      contentPadding: const EdgeInsets.all(16.0)),
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the working hours';
                    } else {
                      setState(() {
                        _hours = value;
                      });
                      return null;
                    }
                  },
                ),
//                TextFormField(
//                    decoration: new InputDecoration(
//                        hintText: 'Enter costs... (optional)',
//                        contentPadding: const EdgeInsets.all(16.0)
//                    ),
//                    keyboardType: TextInputType.numberWithOptions(),
//                    inputFormatters: [
//                      WhitelistingTextInputFormatter.digitsOnly
//                    ],
//                    onChanged: (value) {
//                      setState(() {
//                        _costs = value;
//                      });
//                    }
//                ),
                InkWell(
                  onTap: () {
                    _selectDate();
                  },
                  child: IgnorePointer(
                    child: new TextFormField(
                      controller: txt,
                      decoration: new InputDecoration(
                          hintText: 'Enter deadline...',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          contentPadding: const EdgeInsets.all(16.0)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a Date';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
//                Padding(
//                  padding: EdgeInsets.only(left: 16.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Phase: "),
//                      new DropdownButton(
//                        value: _phase,
//                        items: _dropDownMenuItems,
//                        onChanged: _setPhase,
//                      )
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(left: 16.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Follow-up phase: "),
//                      new DropdownButton(
//                        value: _followUpPhase,
//                        items: _dropDownMenuItems,
//                        onChanged: _setFollowUpPhase,
//                      )
//                    ],
//                  ),
//                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 5.0),
                width: MediaQuery.of(context).size.width / 2 - 10.0,
                child: RaisedButton(
                  color: Color(0xff03a6dd),
                  child: Text(
                    "CANCEL",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0),
                width: MediaQuery.of(context).size.width / 2 - 10.0,
                child: RaisedButton(
                  color: Color(0xff03a6dd),
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      DocumentReference docRef =
                          Firestore.instance.collection('tasks').document();
                      docRef.setData({
                        'task': _task,
                        'detail': _detail,
                        //'link': _link,
                        // TODO: decide if done (boolean) or status (numbers)
                        //'done': false,
                        'status': 0,
                        'enddate': _date,
                        'hours': int.parse(_hours),
                        'points': int.parse(_hours) * 60,
                        //'costs': int.parse(_costs),
                        //'phase': _phase,
                        //'followUpPhase': _followUpPhase,
                        //'project': appState.currentProjectID,
                        'owner': appState.currentUser.id
                      });

//                final DocumentReference postRef = Firestore.instance.collection('phases').document(_phase);
//                Firestore.instance.runTransaction((Transaction tx) async {
//                  DocumentSnapshot postSnapshot = await tx.get(postRef);
//                  if (postSnapshot.exists) {
//                    await tx.update(postRef, <String, dynamic>{
//                      'tasks': FieldValue.arrayUnion([docRef.documentID])
//                    });
//                  }
//                });

                      //Navigator.pop(context, postRef.documentID);

                      Navigator.pop(context);

                      //Navigator.pushNamed(context, '/');
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2040));
    if (picked != null) {
      setState(() {
        txt.text = format.format(picked);
        _date = Timestamp.fromDate(picked);
      });
    }
  }

//  Future<List<String>> initPhases() async {
//    DocumentSnapshot querySnapshot = await Firestore.instance
//        .collection('projects')
//        .document(widget.projectID)
//        .get();
//    if (querySnapshot.exists) {
//      return new List<String>.from(querySnapshot.data['phases']);
//    }
//    return null;
//  }

//  void initDropdown() async {
//
//    _phases = await initPhases();
//
//    List<DropdownMenuItem<String>> items = new List();
//    for (String phase in _phases) {
//      DocumentSnapshot querySnapshot = await Firestore.instance
//          .collection('phases')
//          .document(phase)
//          .get();
//      if (querySnapshot.exists) {
//        items.add(new DropdownMenuItem(
//            value: phase,
//            child: new Text(querySnapshot['name'])
//        ));
//      }
//    }
//
//    setState(() {
//      _dropDownMenuItems = items;
////      if (widget.phaseID.isNotEmpty) {
////        _setPhase(widget.phaseID);
////      }
//    });
//  }

  void _setPhase(String selectedPhase) {
    setState(() {
      _phase = selectedPhase;
    });
  }

  void _setFollowUpPhase(String selectedPhase) {
    setState(() {
      _followUpPhase = selectedPhase;
    });
  }
}
