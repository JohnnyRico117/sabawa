import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:sabawa/ui/widgets/achievement_item.dart';

class Friend extends StatefulWidget {
  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<Friend> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ACHIEVEMENTS'),
    Tab(text: 'FRIENDS'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: new BoxDecoration(
          color: Color(0xff310818),
        ),
        child: Column(
          children: <Widget>[
            _buildAvatar(),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 45.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 20,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Image.asset(
                          "assets/goal.png",
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: _neonText("1", Colors.white, 20),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 20,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Image.asset(
                          "assets/nav/star.png",
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: _neonText("20000", Colors.white, 20),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 20,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Image.asset(
                          "assets/nav/gold.png",
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: _neonText("3000", Colors.white, 20),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 17.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 10.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
              tabs: myTabs,
            ),
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                    color: Color(0xfff3f2dd),
                    border: Border(bottom: BorderSide(color: Color(0xff707070), width: 1))
                ),
                    //height: 200.0,
                    child: new TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        ListView(
                          children: <Widget>[
                            AchievementItem(),
                            AchievementItem(),
                            AchievementItem(),
                            AchievementItem(),
                            AchievementItem(),

                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            new Card(
                              child: new ListTile(
                                leading: const Icon(Icons.home),
                                title: new TextField(
                                  decoration: const InputDecoration(hintText: 'Search for address...'),
                                ),
                              ),
                            ),
                            new Card(
                              child: new ListTile(
                                leading: const Icon(Icons.location_on),
                                title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                                trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                              ),
                            ),new Card(
                              child: new ListTile(
                                leading: const Icon(Icons.home),
                                title: new TextField(
                                  decoration: const InputDecoration(hintText: 'Search for address...'),
                                ),
                              ),
                            ),
                            new Card(
                              child: new ListTile(
                                leading: const Icon(Icons.location_on),
                                title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                                trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),


            ),

          ],
        ),
      ),
    );
  }

  Widget _neonSign(Color color, IconData icon) {
    return Container(
      width: 80,
      height: 42,
      decoration: new BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color,
            offset: Offset(0, 0),
            blurRadius: 9,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xff310818),
              offset: Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Center(
            child: Container(
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 18,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Icon(
                icon,
                color: color,
                size: 25.0,
              ),
            ),
          ),
//                  Stack(
//                    //fit: StackFit.expand,
//                    children: <Widget>[
//                      Center(
//                        child: Icon(icon, size: 30, color: color ),
//                      ),
//                      Center(
//                          child: Padding(
//                            padding: EdgeInsets.only(left: 10.0),
//                            child: Icon(icon, size: 10, color: color ),
//                          )
//                      ),
//                      Center(
//                        child: ClipRect(
//                          child: BackdropFilter(
//                            filter: ImageFilter.blur(
//                              sigmaX: 4.0,
//                              sigmaY: 4.0,
//                            ),
//                            child: Container(
//
//                                alignment: Alignment.center,
//                                width: 30.0,
//                                height: 30.0,
//                                child: Center(
//                                  child: Icon(icon, size: 20, color: color.withOpacity(0.6) ),
//                                )
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
        padding: EdgeInsets.only(top: 40.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
              //backgroundImage: new NetworkImage(appState.user.photoUrl),
              radius: 60.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _neonText("EKATERINA", Color(0xffff3988), 39.0),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _neonSign(Color(0xffff3988), Icons.person_add),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    _neonSign(Color(0xffff3988), Icons.mail_outline),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget _neonText(String text, Color color, double fontSize) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Beon',
            color: color.withOpacity(0.1),
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            shadows: [
              BoxShadow(
                  color: color,
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0),
            ],
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Beon',
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            shadows: [
              BoxShadow(
                color: color,
                offset: Offset(0, 0),
                blurRadius: 9,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
