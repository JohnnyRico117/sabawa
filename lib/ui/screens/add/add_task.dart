import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class AddTask extends StatefulWidget {

  final String phaseID;
  final String projectID;

  AddTask(this.phaseID, this.projectID);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  StateModel appState;

  final _formKey = GlobalKey<FormState>();

  String _task = '';
  Timestamp _date;
  String _hours;

  String _phase;
  List<String> _phases;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  var txt = new TextEditingController();
  DateFormat format = new DateFormat("dd.MM.yyyy 'at' hh:mm");

  @override
  void initState() {
    super.initState();
    initDropdown();
  }

  void changedDropDownItem(String selectedPhase) {
    setState(() {
      _phase = selectedPhase;
    });
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Add a new task')
      ),
      body: new ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      hintText: 'Enter something to do...',
                      contentPadding: const EdgeInsets.all(16.0)
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter something to do';
                    } else {
                      setState(() {
                        _task = value;
                      });
                    }
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(
                      hintText: 'Enter working hours...',
                      contentPadding: const EdgeInsets.all(16.0)
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the working hours';
                    } else {
                      setState(() {
                        _hours = value;
                      });
                    }
                  },
                ),
                InkWell(
                  onTap: () {
                    _selectDate();
                  },
                  child: IgnorePointer(
                    child: new TextFormField(
                      controller: txt,
                      decoration: new InputDecoration(
                          hintText: 'Enter deadline...',
                          contentPadding: const EdgeInsets.all(16.0)
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a Date';
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Phase: "),
                      new DropdownButton(
                        value: _phase,
                        items: _dropDownMenuItems,
                        onChanged: changedDropDownItem,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                DocumentReference docRef = Firestore.instance.collection('tasks').document();
                docRef.setData({
                  'task' : _task,
                  // TODO: decide if done (boolean) or status (numbers)
                  'done': false,
                  'status': 0,
                  'enddate': _date,
                  'hours': int.parse(_hours),
                  'points': int.parse(_hours) * 60,
                  'phase': _phase,
                  'project': appState.currentProjectID
                });

                final DocumentReference postRef = Firestore.instance.collection('phases').document(_phase);
                Firestore.instance.runTransaction((Transaction tx) async {
                  DocumentSnapshot postSnapshot = await tx.get(postRef);
                  if (postSnapshot.exists) {
                    await tx.update(postRef, <String, dynamic>{
                      'tasks': FieldValue.arrayUnion([docRef.documentID])
                    });
                  }
                });

                Navigator.pop(context, postRef.documentID);

                //Navigator.pushNamed(context, '/');
              }
            },
          )
        ],
      ),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2040)
    );
    if(picked != null) {
      setState(() {
        txt.text = format.format(picked);
        _date = Timestamp.fromDate(picked);
      });
    }
  }

  Future<List<String>> initPhases() async {
    DocumentSnapshot querySnapshot = await Firestore.instance
        .collection('projects')
        .document(widget.projectID)
        .get();
    if (querySnapshot.exists) {
      return new List<String>.from(querySnapshot.data['phases']);
    }
    return null;
  }

  void initDropdown() async {

    _phases = await initPhases();

    List<DropdownMenuItem<String>> items = new List();
    for (String phase in _phases) {
      DocumentSnapshot querySnapshot = await Firestore.instance
          .collection('phases')
          .document(phase)
          .get();
      if (querySnapshot.exists) {
        items.add(new DropdownMenuItem(
            value: phase,
            child: new Text(querySnapshot['name'])
        ));
      }
    }

    setState(() {
      _dropDownMenuItems = items;
      if (widget.phaseID.isNotEmpty) {
        changedDropDownItem(widget.phaseID);
      }
    });
  }
}

