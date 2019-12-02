import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/phase.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/todo_item.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

import 'package:sabawa/ui/screens/add/add_task.dart';

class ToDoList extends StatefulWidget {

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  StateModel appState;

  String _sortby;
  List<String> _phaseFilter = new List();
  List<Phase> _phases = new List();
  bool filter1 = false;

  @override
  void initState() {
    super.initState();
    initPhases();
    _dropDownMenuItems = getDropDownMenuItems();
    _sortby = _dropDownMenuItems[0].value;
  }

  List _sortType = ['Alphabet', 'Date', 'Points'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String sort in _sortType) {
      items.add(new DropdownMenuItem(
          value: sort,
          child: new Text(sort)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedSort) {
    if (this.mounted) {
      setState(() {
        _sortby = selectedSort;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sort by: "),
              DropdownButton(
                  value: _sortby,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem
              ),
              Text("Filter:"),
              Text("1:"),
              Checkbox(
                  value: filter1,
                  onChanged: (bool value) {
                    print(value);
                    print(filter1);
                    List<String> _temp = new List();
                    if (this.mounted) {
                      if (value) {
                        setState(() {
                          filter1 = value;
                          //_temp.add("VhrdI7VVMjfDhoOBmODU");
                          //_phaseFilter = _temp;
                          _phaseFilter.add("VhrdI7VVMjfDhoOBmODU");
                        });
                      } else {
                        setState(() {
                          filter1 = value;
                          _phaseFilter.remove("VhrdI7VVMjfDhoOBmODU");
                        });
                      }
                    }
                    print(_phaseFilter);
                  }
              ),
              Text("2:"),
              Checkbox(
                  value: false,
                  onChanged: null
              )
            ],
          ),
          Expanded(
            child: new StreamBuilder(
              stream: Firestore.instance.collection('tasks').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return LoadingIndicator();

                switch(_sortby) {
                  case 'Alphabet':
                    snapshot.data.documents.sort((a, b) => a['task'].toString().toLowerCase().compareTo(b['task'].toString().toLowerCase()));
                    break;
                  case 'Points':
                  //snapshot.data.documents.sort((a, b) => int.parse(a['points'].toString()).compareTo(int.parse(b['points'].toString())));
                    snapshot.data.documents.sort((a, b) => a['points'].compareTo(b['points']));
                    break;
                  case 'Date':
                    snapshot.data.documents.sort((a, b) => a['enddate'].toString().compareTo(b['enddate'].toString()));
                    break;
                  default:
                    snapshot.data.documents.sort((a, b) => a['task'].toString().compareTo(b['task'].toString()));
                    break;
                }

                if (_phaseFilter.isEmpty) {
                  return new ListView(
                    children: snapshot.data.documents
                        .map((document) {
                          Phase pha;
                          Iterable<Phase> ps = _phases.where((p) => p.id == document.data['phase']);
                          if (ps.isNotEmpty) {
                            pha = ps.first;
                          }
                          return ToDoItem(document, pha);
                        }).toList(),
                  );
                } else {
                  return new ListView(
                    children: snapshot.data.documents
                        .where((d) => _phaseFilter.contains(d.data['phase']))
                        .map((document) {
                          Phase pha = _phases.where((p) => p.id == document.data['phase']).first;
                          return ToDoItem(document, pha);
                        }).toList(),
                  );
                }
              },
            ),
          ),
          ListTile(
            leading: new FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTask("", appState.currentProjectID)),
                  );
                },
                child: Icon(Icons.add)
            ),
            title: new Text("New task"),
          ),
        ],
      ),
    );
  }

  void initPhases() async {
    List<Phase> _ph = new List();

    QuerySnapshot querysnaps = await Firestore.instance
        .collection('phases')
        .where("projectID", isEqualTo: "ZPGphdEX3iM5NIYMN6G0")
        .getDocuments();

    List<DocumentSnapshot> snaps = querysnaps.documents;

    snaps.forEach((snap) {
      _ph.add(Phase.fromSnap(snap));
    });

    setState(() {
      _phases = _ph;
    });


  }

  @override
  void dispose() {
    super.dispose();
  }
}