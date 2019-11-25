import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class AddProject extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new AddProjectState();
}

class AddProjectState extends State<AddProject> {

  StateModel appState;

  final _formKey = GlobalKey<FormState>();

  String _project = '';
  String _endddate = '';

  var txt = new TextEditingController();
  DateFormat format = new DateFormat("dd.MM.yyyy 'at' hh:mm");

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Create new project')
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
                      hintText: 'Enter Project name...',
                      contentPadding: const EdgeInsets.all(16.0)
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a Project name';
                    } else {
                      setState(() {
                        _project = value;
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
                        } else {
                          setState(() {
                            _endddate = txt.text;
                          });
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
                addProject();
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
    if(picked != null) setState(() {
      txt.text = format.format(picked);
    });
  }

  addProject() {

    DocumentReference docRef = Firestore.instance.collection('projects').document();
    docRef.setData({
      'name' : _project,
      'enddate': _endddate,
      'owner': appState.user.uid,
    });

    // TODO: Delete
    print("ID: " + docRef.documentID.toString());

    final DocumentReference postRef = Firestore.instance.collection('users').document(appState.user.uid);
    Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(postRef);
      if (postSnapshot.exists) {
        await tx.update(postRef, <String, dynamic>{
          'projects': FieldValue.arrayUnion([docRef.documentID.toString()])
        });
      }
    });

    appState.currentUser.projects.add(docRef.documentID.toString());

    //Navigator.pop(context);

  }

}