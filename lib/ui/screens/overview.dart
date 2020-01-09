import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:sabawa/utils/enums/card_types.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/model/phase.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/todo_item.dart';

import 'package:sabawa/ui/widgets/progress_card.dart';
import 'package:sabawa/ui/widgets/profile_card.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

import 'package:sabawa/ui/screens/detail_todo.dart';

import 'package:sabawa/ui/screens/add/add_task.dart';

class Overview extends StatefulWidget {

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

//  StateModel appState;
//  bool _missed = false;
//  double _percent = 0.4;
//  List<String> _phaseFilter = new List();
//  List<Phase> _phases = new List();
//
//  List<DocumentSnapshot> _snaps = new List();
//
//  @override
//  void initState() {
//    super.initState();
//    initData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    appState = StateWidget.of(context).state;
//
//    if (_snaps.isEmpty) return LoadingIndicator();
//
//    return new Container(
//        padding: const EdgeInsets.all(12),
//        child: ListView(
//          children: <Widget>[
//            //ProfileCard(),
//            _timeFrameSelection(),
//            _selectedTasks(),
////            !_missed ? Container() : ProgressCard(CardType.MISSED, _snaps),
////            ProgressCard(CardType.DAILY, _snaps),
////            ProgressCard(CardType.WEEKLY, _snaps),
////            ProgressCard(CardType.MONTHLY, _snaps),
////            ProgressCard(CardType.PROJECT, _snaps),
//          ],
//        )
//    );
//  }
//
//  void initData() async {
//
//    final prefs = await SharedPreferences.getInstance();
//    String id = prefs.getString('projectID');
//
//    if (id != null) {
//      bool _temp = false;
//
//      QuerySnapshot querysnaps = await Firestore.instance
//          .collection('tasks')
//          .where("project", isEqualTo: id)
//          .getDocuments();
//
//      for (DocumentSnapshot snap in querysnaps.documents) {
//        final double endDate = snap.data['enddate'].seconds / 3600 / 24;
//        final double now = new Timestamp.now().seconds / 3600 / 24;
//
//        double diff = now - endDate;
//
//        if (diff < 0) {
//          _temp = true;
//          break;
//        }
//      }
//
//      if (mounted) {
//        setState(() {
//          _missed = _temp;
//          _snaps = querysnaps.documents;
//        });
//      }
//    }
//  }
//
//  Widget _timeFrameSelection() {
//    return Container(
//      margin: EdgeInsets.symmetric(vertical: 20.0),
//      height: 100.0,
//      child: ListView(
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.symmetric(
//              horizontal: 5.0
//            ),
//            child: Container(
//                decoration: ShapeDecoration(
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(15.0),
//                  ),
//                  color: Colors.red,
//                ),
//                width: 80.0,
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(
//                          top: 5.0
//                      ),
//                      child: Text(
//                        "MON",
//                        style: TextStyle(
//                            fontSize: 14.0,
//                            fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(
//                          bottom: 5.0
//                      ),
//                      child: Text(
//                        "22",
//                        style: TextStyle(
//                          fontSize: 20.0,
//                        ),
//
//                      ),
//                    ),
//
//                    CircularPercentIndicator(
//                      progressColor: Colors.green,
//                      radius: 40.0,
//                      percent: _percent,
//                      lineWidth: 5.0,
//                      center: Text((_percent * 100).round().toString() + "%",
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 12.0
//                        ),
//                      ),
//                    ),
//                  ],
//                )
//            ),
//          ),
//          Container(
//            width: 90.0,
//            color: Colors.blue,
//          ),
//          Container(
//            width: 90.0,
//            color: Colors.green,
//          ),
//          Container(
//            width: 90.0,
//            color: Colors.yellow,
//          ),
//          Container(
//            width: 90.0,
//            color: Colors.orange,
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _selectedTasks() {
//    return Expanded(
//      child: new StreamBuilder(
//        stream: Firestore.instance.collection('tasks').where("project", isEqualTo: appState.currentProjectID).snapshots(),
//        builder: (BuildContext context,
//            AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (!snapshot.hasData) return LoadingIndicator();
//
////          switch(_sortBy) {
////            case 'Alphabet':
////              snapshot.data.documents.sort((a, b) => a['task'].toString().toLowerCase().compareTo(b['task'].toString().toLowerCase()));
////              break;
////            case 'Points':
////              snapshot.data.documents.sort((a, b) => a['points'].compareTo(b['points']));
////              break;
////            case 'Date':
////              snapshot.data.documents.sort((a, b) => a['enddate'].toString().compareTo(b['enddate'].toString()));
////              break;
////            default:
////              snapshot.data.documents.sort((a, b) => a['task'].toString().compareTo(b['task'].toString()));
////              break;
////          }
//
//          if (_phaseFilter.isEmpty) {
//            return new ListView(
//              children: snapshot.data.documents
//                  .map((document) {
//                Phase pha;
//                Iterable<Phase> ps = _phases.where((p) => p.id == document.data['phase']);
//                if (ps.isNotEmpty) {
//                  pha = ps.first;
//                }
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          } else {
//            return new ListView(
//              children: snapshot.data.documents
//                  .where((d) => _phaseFilter.contains(d.data['phase']))
//                  .map((document) {
//                Phase pha = _phases.where((p) => p.id == document.data['phase']).first;
//                return ToDoItem(document, pha);
//              }).toList(),
//            );
//          }
//        },
//      ),
//    );
//  }


  StateModel appState;

  Sort _sortBy;
  bool _sort = false;
  List<String> _phaseFilter = new List();
  List<Phase> _phases = new List();
  Wrap _checkBoxWrap = new Wrap();
  bool _expanded = false;
  double _percent = 0.4;

  Color _horizontalItemsColor = Color(0xFF002972);
  //Color _horizontalItemsColor = Colors.red;
  Color _horizontalUnselectedText = Color(0xFF0050a1);

  @override
  void initState() {
    super.initState();
    initPhases();
//    _dropDownMenuItems = getDropDownMenuItems();
//    _sortBy = _dropDownMenuItems[0].value;
  }

//  List _sortType = ['Alphabet', 'Date', 'Points'];
//  List<DropdownMenuItem<String>> _dropDownMenuItems;
//
//  List<DropdownMenuItem<String>> getDropDownMenuItems() {
//    List<DropdownMenuItem<String>> items = new List();
//    for (String sort in _sortType) {
//      items.add(new DropdownMenuItem(
//          value: sort,
//          child: new Text(sort)
//      ));
//    }
//    return items;
//  }
//
//  void changedDropDownItem(String selectedSort) {
//    if (this.mounted) {
//      setState(() {
//        _sortBy = selectedSort;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Scaffold(
      backgroundColor: Color(0xFF0050a1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          children: <Widget>[
            _timeFrameSelection(),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  "Sort by: ",
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(right: 10.0),
//                  child: DropdownButton(
//                      style: TextStyle(
//                        color: Colors.white,
//                      ),
//                      value: _sortBy,
//                      items: _dropDownMenuItems,
//                      onChanged: changedDropDownItem
//                  ),
//                ),
//                Text(
//                  "Filter by:",
//                  style: TextStyle(
//                    color: Colors.white,
//                  ),
//                ),
//                IconButton(
//                  icon: _expanded ? Icon(Icons.arrow_drop_up, color: Colors.black54) : Icon(Icons.arrow_drop_down, color: Colors.black54),
//                  onPressed: () {
//                    setState(() {
//                      _expanded = !_expanded;
//                    });
//                  },
//                ),
//              ],
//            ),
            _expanded ? _checkBoxWrap : Container(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 15.0
                ),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops:
                    _sortBy == Sort.Date ? [0.1, 0.101, 0.102] :
                    _sortBy == Sort.Points ? [0.27, 0.271, 0.272] :
                    [0.0, 0.0, 0.0],
                    colors: [
                      Colors.white,
                      Colors.black,
                      Colors.white
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(15.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  //color: Colors.white,
                ),
                child: new StreamBuilder(
                  stream: Firestore.instance.collection('tasks').where("project", isEqualTo: appState.currentProjectID).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return LoadingIndicator();

                    switch(_sortBy) {
                      case Sort.Alphabet:
                        snapshot.data.documents.sort((a, b) => a['task'].toString().toLowerCase().compareTo(b['task'].toString().toLowerCase()));
                        break;
                      case Sort.Points:
                        snapshot.data.documents.sort((a, b) => a['points'].compareTo(b['points']));
                        break;
                      case Sort.Date:
                        snapshot.data.documents.sort((a, b) => a['enddate'].toString().compareTo(b['enddate'].toString()));
                        break;
                      default:
                        snapshot.data.documents.sort((a, b) => a['enddate'].toString().compareTo(b['enddate'].toString()));
                        break;
                    }

                    if (_phaseFilter.isEmpty) {
                      return new ListView(
                        children: snapshot.data.documents
                            .where((d) => d.data["status"] != 2)
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
                            .where((d) => _phaseFilter.contains(d.data['phase']) && d.data["status"] != 2)
                            .map((document) {
                          Phase pha;
                          Iterable<Phase> ps = _phases.where((p) => p.id == document.data['phase']);
                          if (ps.isNotEmpty) {
                            pha = ps.first;
                          }
                          return ToDoItem(document, pha);
                        }).toList(),
                      );
                    }
                  },
                ),
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
      floatingActionButton:
//          FloatingActionButton(
//              onPressed: () {
//                Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => AddTask("", appState.currentProjectID)),
//                );
//              },
//              child: Icon(Icons.add)
//          ),
      SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: true,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: true,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () {
          setState(() {
            _sort = false;
          });
        },
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Color(0xFF0050a1),
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          _sort ? SpeedDialChild(
            child: Icon(Icons.sort_by_alpha),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.yellow,
            label: 'Alphabet',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _sortBy = Sort.Alphabet;
              });
            },
          ) :
          SpeedDialChild(
            child: Icon(Icons.add),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.green,
            label: 'Add',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTask("", appState.currentProjectID)),
              );
            },
          ),
          _sort ? SpeedDialChild(
            child: Icon(Icons.star),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.yellow,
            label: 'Points',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _sortBy = Sort.Points;
              });
            },
          ) :
          SpeedDialChild(
            child: Icon(Icons.sort),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.yellow,
            label: 'Sort',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _sort = !_sort;
              });
            },
          ),
          _sort ? SpeedDialChild(
            child: Icon(Icons.today),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.yellow,
            label: 'Date',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _sortBy = Sort.Date;
              });
            },
          ) :
          SpeedDialChild(
            child: Icon(Icons.filter),
            //backgroundColor: Color(0xFF0050a1),
            backgroundColor: Colors.red,
            label: 'Filter',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('THIRD CHILD'),
          ),

        ],
      ),
    );
  }

  void _sortDialog(BuildContext context) {
    Sort _sortedBy = Sort.Alphabet;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sort by"),
            content: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Alphabet'),
                  leading: Radio(
                    value: Sort.Alphabet,
                    groupValue: _sortedBy,
                    onChanged: (Sort value) {
                      setState(() { _sortedBy = value; });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Date'),
                  leading: Radio(
                    value: Sort.Date,
                    groupValue: _sortedBy,
                    onChanged: (Sort value) {
                      setState(() { _sortedBy = value; });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Points'),
                  leading: Radio(
                    value: Sort.Points,
                    groupValue: _sortedBy,
                    onChanged: (Sort value) {
                      setState(() { _sortedBy = value; });
                    },
                  ),
                ),
              ],
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
                    _sortBy = _sortedBy;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }

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

  Widget _timeFrameSelection() {
    return Container(
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        height: 65.0,
        child: ListView(
          padding: EdgeInsets.only(
              left: 15.0
          ),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0
              ),
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                  ),
                  width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0
                            ),
                            child: Text(
                              "MON",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.0
                            ),
                            child: Text(
                              "22",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),

                            ),
                          ),
                        ],
                      ),
                      CircularPercentIndicator(
                        progressColor: Colors.green,
                        radius: 40.0,
                        percent: _percent,
                        lineWidth: 5.0,
                        center: Text((_percent * 100).round().toString() + "%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),

                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0
              ),
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _horizontalItemsColor,
                  ),
                  width: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0
                            ),
                            child: Text(
                              "TUE",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.0
                            ),
                            child: Text(
                              "23",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),
                        ],
                      ),
//                    CircularPercentIndicator(
//                      progressColor: Colors.green,
//                      radius: 40.0,
//                      percent: _percent,
//                      lineWidth: 5.0,
//                      center: Text((_percent * 100).round().toString() + "%",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 12.0,
//                          color: _horizontalUnselectedText,
//                        ),
//                      ),
//                    ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0
              ),
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _horizontalItemsColor,
                  ),
                  width: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0
                            ),
                            child: Text(
                              "WED",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.0
                            ),
                            child: Text(
                              "24",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _horizontalUnselectedText,
                              ),

                            ),
                          ),
                        ],
                      ),
//                    CircularPercentIndicator(
//                      progressColor: Colors.green,
//                      radius: 40.0,
//                      percent: _percent,
//                      lineWidth: 5.0,
//                      center: Text((_percent * 100).round().toString() + "%",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 12.0,
//                          color: _horizontalUnselectedText,
//                        ),
//                      ),
//                    ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0
              ),
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _horizontalItemsColor,
                  ),
                  width: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0
                            ),
                            child: Text(
                              "THU",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.0
                            ),
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _horizontalUnselectedText,
                              ),

                            ),
                          ),
                        ],
                      ),
//                    CircularPercentIndicator(
//                      progressColor: Colors.green,
//                      radius: 40.0,
//                      percent: _percent,
//                      lineWidth: 5.0,
//                      center: Text((_percent * 100).round().toString() + "%",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 12.0,
//                          color: _horizontalUnselectedText,
//                        ),
//                      ),
//                    ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0
              ),
              child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _horizontalItemsColor,
                  ),
                  width: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0
                            ),
                            child: Text(
                              "FRI",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.0
                            ),
                            child: Text(
                              "26",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: _horizontalUnselectedText,
                              ),
                            ),
                          ),


                        ],
                      ),
//                    CircularPercentIndicator(
//                      progressColor: Colors.green,
//                      radius: 40.0,
//                      percent: _percent,
//                      lineWidth: 5.0,
//                      center: Text((_percent * 100).round().toString() + "%",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 12.0,
//                          color: _horizontalUnselectedText,
//                        ),
//                      ),
//                    ),
                    ],
                  )
              ),
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

enum Sort{ Alphabet, Date, Points}