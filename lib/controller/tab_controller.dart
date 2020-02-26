import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';

import 'package:sabawa/controller/points_controller.dart';

import 'package:sabawa/ui/screens/todo_list.dart';
import 'package:sabawa/ui/screens/home.dart';
import 'package:sabawa/ui/screens/login.dart';

import 'package:sabawa/ui/screens/profile.dart';
//import 'package:sabawa/ui/screens/progress.dart';
import 'package:sabawa/ui/shapes/rainbow_corner_full.dart';
import 'package:sabawa/controller/todo_controller.dart';
import 'package:sabawa/ui/screens/design.dart';
import 'package:sabawa/ui/screens/friend.dart';
import 'package:sabawa/ui/screens/phases.dart';
import 'package:sabawa/ui/screens/feedback.dart';
import 'package:sabawa/ui/screens/overview.dart';
import 'package:sabawa/ui/screens/shopping_mall.dart';
import 'package:sabawa/ui/widgets/loading_indicator.dart';

class SabawaTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SabawaTabControllerState();
}

class SabawaTabControllerState extends State<SabawaTabController> {
  StateModel appState;
  int _selectedIndex = 1;
  Color _bottomNavBackGround = Color(0xfff3f2dd);

  List<Widget> _widgetOptions = <Widget>[
    Profile(),
    ToDoTabController(),
    PointsTabController(),
    Shop(),
    FeedbackScreen(),
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
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(70.0),
//        child: AppBar(
//          elevation: 0.0,
//          //backgroundColor: Color(0xFF00ACC1),
//          leading: GestureDetector(
//              onTap: () => Navigator.pushNamed(context, '/profile'),
//              child: Container(
//                padding: EdgeInsets.all(8.0),
//                child: CircleAvatar(
//                  backgroundImage: appState.user.photoUrl == null
//                      ? null
//                      : new NetworkImage(appState.user.photoUrl),
//                ),
//              )),
//          title: GestureDetector(
//            //child: Text(appState.currentProjectName),
//            child: Text(
//              "Project",
//              style: TextStyle(color: Colors.white),
//            ),
//            onTap: () => Navigator.pushNamed(context, '/projects'),
//          ),
//          actions: <Widget>[
//            IconButton(
//                icon: Icon(Icons.settings),
//                onPressed: () => Navigator.pushNamed(context, '/settings'))
//          ],
//        ),
//      ),


      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 40.0,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: _bottomNavBackGround,
            icon: Image.asset(
              "assets/nav/bandana_border.png",
              width: 40.0,
            ),
            activeIcon: Image.asset(
              "assets/nav/forehead-bandana.png",
              width: 40.0,
            ),
            title: Text('PROFILE',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: _bottomNavBackGround,
            icon: Image.asset(
              "assets/nav/cassette_border.png",
              width: 40.0,
            ),
            activeIcon: Image.asset(
              "assets/nav/cassette.png",
              width: 40.0,
            ),
            title: Text('TO-DO',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
//          BottomNavigationBarItem(
//            backgroundColor: _bottomNavBackGround,
//            icon: Icon(Icons.list),
//            title: Text('To-Do'),
//          ),
          BottomNavigationBarItem(
            backgroundColor: _bottomNavBackGround,
            icon: Image.asset(
              "assets/nav/star_border.png",
              width: 40.0,
            ),
            activeIcon: Image.asset(
              "assets/nav/star.png",
              width: 40.0,
            ),
            title: Text('POINTS',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: _bottomNavBackGround,
            icon: Image.asset(
              "assets/nav/gold_border.png",
              width: 40.0,
            ),
            activeIcon: Image.asset(
              "assets/nav/gold.png",
              width: 40.0,
            ),
            title: Text('SHOP',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: _bottomNavBackGround,
            icon: Image.asset(
              "assets/nav/feedback_border.png",
              width: 40.0,
            ),
            activeIcon: Image.asset(
              "assets/nav/feedback.png",
              width: 40.0,
            ),
            title: Text('FEEDBACK',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Color(0xFF0050a1),
        //unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),
    );
  }
}
