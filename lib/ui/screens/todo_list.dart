import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String _sortBy;
  List<String> _phaseFilter = new List();
  List<Phase> _phases = new List();
  Wrap _checkBoxWrap = new Wrap();
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    initPhases();
    _dropDownMenuItems = getDropDownMenuItems();
    _sortBy = _dropDownMenuItems[0].value;
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
        _sortBy = selectedSort;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Sort by: "),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: DropdownButton(
                      value: _sortBy,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem
                  ),
                ),
                Text("Filter by:"),
                IconButton(
                  icon: _expanded ? Icon(Icons.arrow_drop_up, color: Colors.black54) : Icon(Icons.arrow_drop_down, color: Colors.black54),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ],
            ),
            _expanded ? _checkBoxWrap : Container(),
            Expanded(
              child: new StreamBuilder(
                stream: Firestore.instance.collection('tasks').where("project", isEqualTo: appState.currentProjectID).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return LoadingIndicator();

                  switch(_sortBy) {
                    case 'Alphabet':
                      snapshot.data.documents.sort((a, b) => a['task'].toString().toLowerCase().compareTo(b['task'].toString().toLowerCase()));
                      break;
                    case 'Points':
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
//            ListTile(
//              leading: new FloatingActionButton(
//                  onPressed: () {
//                    Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => AddTask("", appState.currentProjectID)),
//                    );
//                  },
//                  child: Icon(Icons.add)
//              ),
//              title: new Text("New task"),
//            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTask("", appState.currentProjectID)),
            );
          },
          child: Icon(Icons.add)
      ),
    );
  }

  void initPhases() async {

    List<Phase> _ph = new List();
    final prefs = await SharedPreferences.getInstance();

    QuerySnapshot querySnaps = await Firestore.instance
        .collection('phases')
        .where("projectID", isEqualTo: prefs.getString('projectID'))
        .getDocuments();

    List<DocumentSnapshot> snaps = querySnaps.documents;

    snaps.forEach((snap) {
      _ph.add(Phase.fromSnap(snap));
    });

    _ph.sort((a, b) => a.position.compareTo(b.position));

    setState(() {
      _phases = _ph;
      initCheckBoxes(_ph);
    });
  }

  void initCheckBoxes(List<Phase> phases) {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < phases.length; i++){
      list.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    color: Color(_phases[i].color),
                    shape: BoxShape.circle
                ),
              ),
            ),
            Text(_phases[i].name),
            Checkbox(
              value: _phaseFilter.contains(phases[i].id),
              onChanged: (bool value) {
                //if (this.mounted) {
                if (value) {
                  setState(() {
                    _phaseFilter.add(phases[i].id);
                    initCheckBoxes(phases);
                  });
                } else {
                  setState(() {
                    _phaseFilter.remove(phases[i].id);
                    initCheckBoxes(phases);
                  });
                }
                //}
              }
            ),
          ],
        )
      );
    }
    setState(() {
      _checkBoxWrap = Wrap(children: list);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}