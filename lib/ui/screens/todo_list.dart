import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
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

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _sortby = _dropDownMenuItems[0].value;
  }

  List _sortType = ['Alphabet', 'Date'];
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
    setState(() {
      _sortby = selectedSort;
    });
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
              new DropdownButton(
                  value: _sortby,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem
              )
            ],
          ),
          Expanded(
            child: new StreamBuilder(
              stream: Firestore.instance.collection('tasks').snapshots(),
              //stream: Firestore.instance.collection('Tasks').where("Giver", isEqualTo: appState.user.uid).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return LoadingIndicator();
                return ListView.builder(

                    padding: const EdgeInsets.all(16.0),
                    //itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, i) {

                      switch(_sortby) {
                        case 'Alphabet':
                          snapshot.data.documents.sort((a, b) => a['task'].toString().compareTo(b['task'].toString()));
                          break;
                        case 'Points':
                          snapshot.data.documents.sort((a, b) => int.parse(a['Points'].toString()).compareTo(int.parse(b['Points'].toString())));
                          //snapshot.data.documents.sort((a, b) => a['points'].compareTo(b['points']));
                          break;
                        case 'Date':
                          //snapshot.data.documents.sort((a, b) => a['date'].toString().compareTo(b['date'].toString()));
                          break;
                        default:
                          snapshot.data.documents.sort((a, b) => a['Task'].toString().compareTo(b['Task'].toString()));
                          break;
                      }
                      return ToDoItem(snapshot.data.documents[i]);
                    });
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

  @override
  void dispose() {
    super.dispose();
  }
}