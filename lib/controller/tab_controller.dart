import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';

import 'package:sabawa/ui/screens/todo_list.dart';
import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/ui/screens/progress.dart';
import 'package:sabawa/ui/screens/friend_list.dart';
import 'package:sabawa/ui/screens/phases.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class SabawaTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SabawaTabControllerState();
}

class SabawaTabControllerState extends State<SabawaTabController> {

  StateModel appState;
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Progress(),
    ToDoList(),
    FriendList(),
    Phases(),
    Center(child: Icon(Icons.lightbulb_outline)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return LoadingIndicator();
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
//    } else if (appState.newuser == true) {
//      return new ProfileSetUp();
    } else {
      return _buildBottomTabs();
//      return _buildTabView(
//        body: _buildTabsContent(),
//      );
    }
  }

  Widget _buildBottomTabs() {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile'),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: appState.user.photoUrl == null ? null : new NetworkImage(appState.user.photoUrl),
            ),
          )
        ),
        title: GestureDetector(
          child: Text(appState.currentProjectName),
          onTap: () => Navigator.pushNamed(context, '/projects'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings), 
              onPressed: () => Navigator.pushNamed(context, '/settings')
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.list),
            title: Text('To-Do'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.people),
            title: Text('Friends'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.storage),
            title: Text('Phases'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),
    );
  }
}