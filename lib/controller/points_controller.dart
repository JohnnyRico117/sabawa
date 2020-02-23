import 'package:flutter/material.dart';

import 'package:sabawa/ui/screens/points.dart';
import 'package:sabawa/ui/screens/achievements.dart';

class PointsTabController extends StatefulWidget {
  const PointsTabController({Key key}) : super(key: key);

  @override
  _PointsTabControllerState createState() => _PointsTabControllerState();
}

class _PointsTabControllerState extends State<PointsTabController>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'POINTS'),
    Tab(text: 'ACHIEVEMENTS'),
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
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Image.asset(
                "assets/nav/star.png",
                width: 25.0,
              ),
            ),
            Text(
              "20000",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 5.0),
              child: Image.asset(
                "assets/nav/gold.png",
                width: 25.0,
              ),
            ),
            Text(
              "4000",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF432d2d),
        bottom: TabBar(
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Points(),
          Achievements(),
        ],
//        children: myTabs.map((Tab tab) {
//          final String label = tab.text.toLowerCase();
//          return Center(
//            child: Text(
//              'This is the $label tab',
//              style: const TextStyle(fontSize: 36),
//            ),
//          );
//        }).toList(),
      ),
    );
  }
}
