import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class AddPhase extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new AddPhaseState();
}

class AddPhaseState extends State<AddPhase> {

  StateModel appState;

  final _formKey = GlobalKey<FormState>();

  String _phase = '';
  Timestamp _date;
  Color _color;
  String _endddate = '';

  var txt = new TextEditingController();
  DateFormat format = new DateFormat("dd.MM.yyyy 'at' hh:mm");

  @override
  void initState() {
    super.initState();
    _color = Colors.white;
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Create new project')
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      hintText: 'Enter Phase name...',
                      contentPadding: const EdgeInsets.all(16.0)
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a Phase name';
                    } else {
                      setState(() {
                        _phase = value;
                      });
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () => _colorDialog(context),
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Pick a color")
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: CircleColor(
                          color: _color,
                          circleSize: 30.0
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        color: _color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
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
//                TextFormField(
//                  decoration: new InputDecoration(
//                      hintText: 'Enter points...',
//                      contentPadding: const EdgeInsets.all(16.0)
//                  ),
//                  keyboardType: TextInputType.numberWithOptions(),
//                  inputFormatters: [
//                    WhitelistingTextInputFormatter.digitsOnly
//                  ],
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Please enter some points';
//                    } else {
//                      setState(() {
//                        _points = value;
//                      });
//                    }
//                  },
//                )
              ],
            ),
          ),

          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _addPhase();
              }
              Navigator.pop(context);
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

  void _addPhase() {
    DocumentReference docRef = Firestore.instance.collection('phases').document();
    docRef.setData({
      'name' : _phase,
      'color': _color.value,
      'projectID' : appState.currentProjectID,
      'enddate': _date,

      //'owner': appState.user.uid,
    });

    // TODO: Delete
    print("ID: " + docRef.documentID.toString());

    final DocumentReference postRef = Firestore.instance.collection('projects').document(appState.currentProjectID);
    Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(postRef);
      if (postSnapshot.exists) {
        await tx.update(postRef, <String, dynamic>{
          'phases': FieldValue.arrayUnion([docRef.documentID.toString()])
        });
      }
    });

    //appState.currentUser.projects.add(docRef.documentID.toString());

  }

  void _colorDialog(BuildContext context) {
    Color _pickedColor = Colors.red;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick a color"),
            content: MaterialColorPicker(
              circleSize: 50.0,
              shrinkWrap: true,
              onColorChange: (Color color) {
                _pickedColor = color;
              },
              selectedColor: _pickedColor
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    _color = _pickedColor;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }

    );
  }

}