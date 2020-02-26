import 'package:flutter/material.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class PointsAppBar extends StatefulWidget {

  final Color color;

  PointsAppBar({ Key key, this.color }) : super(key: key);

  @override
  _PointsAppBarState createState() => _PointsAppBarState();
}

class _PointsAppBarState extends State<PointsAppBar> {

  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return AppBar(
      backgroundColor: widget.color,
      elevation: 5.0,
      title: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Image.asset("assets/goal.png",
              width: 25.0,
            ),
          ),
          Text(
            appState.currentUser.level.toString(),
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
            child: Image.asset("assets/nav/star.png",
              width: 25.0,
            ),
          ),
          Text(
            appState.currentUser.points.toString(),
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
            child: Image.asset("assets/nav/gold.png",
              width: 25.0,
            ),
          ),
          Text(
            appState.currentUser.coins.toString(),
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
      //title: Text(appState.user.displayName),
    );
  }
}