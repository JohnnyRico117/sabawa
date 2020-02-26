import 'package:flutter/material.dart';

import 'package:sabawa/ui/screens/points.dart';
import 'package:sabawa/ui/screens/achievements.dart';

import 'package:sabawa/ui/widgets/points_appbar.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
    child: PointsAppBar(color: Color(0xff432d2d)),
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
