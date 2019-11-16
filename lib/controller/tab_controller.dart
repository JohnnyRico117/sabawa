import 'package:flutter/material.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';

import 'package:sabawa/ui/screens/todo_list.dart';
import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/ui/screens/profile.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class SabawaTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SabawaTabControllerState();
}

class SabawaTabControllerState extends State<SabawaTabController> {

  StateModel appState;
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Profile(),
    ToDoList(),
    Center(child: Icon(Icons.lightbulb_outline)),
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

  DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.person, size: _iconSize)),
                Tab(icon: Icon(Icons.list, size: _iconSize)),
                Tab(icon: Icon(Icons.lightbulb_outline, size: _iconSize)),
                Tab(icon: Icon(Icons.lightbulb_outline, size: _iconSize)),
                //Tab(icon: Icon(Icons.settings, size: _iconSize))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }

  Widget _buildBottomTabs() {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => print("TEST"),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: appState.user.photoUrl == null ? null : new NetworkImage(appState.user.photoUrl),
            ),
          )
        ),
        title: const Text('Sabawa'),
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('To-Do'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('???'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('???'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),
    );
  }

  TabBarView _buildTabsContent() {
    return TabBarView(
      children: [
        Profile(),
        ToDoList(),
        Center(child: Icon(Icons.lightbulb_outline)),
        Center(child: Icon(Icons.lightbulb_outline)),
        //Settings()
      ],
    );
  }
}