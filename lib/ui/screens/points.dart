import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/points_tv.dart';
import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class Points extends StatefulWidget {

  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {

  StateModel appState;
  int onscreen;
  double itemHeight;
  double itemWidth;

  @override
  void initState() {
    super.initState();

    onscreen = 0;
    itemHeight = 2;
    itemWidth = 2;
  }

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff7f4418),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xffa4622b),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xff1d2a33),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: getPointsTV(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff7f4418),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xff41322f),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffb2b2b2),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: Color(0xff434040),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: Color(0xff434040),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 30,
                        height: 15,
                        decoration: new BoxDecoration(
                          color: Color(0xff434040),
                          border: Border.all(
                            color: Color(0xff707070),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xfff3f2dd),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xffcdcdce),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xff3a393e),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 25,
                            height: 25,
                            padding: const EdgeInsets.all(1),
                            color: Colors.black,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(1),
                                color: Colors.black,
                              ),Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(1),
                                color: Colors.black,
                              ),Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(1),
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            padding: const EdgeInsets.all(1),
                            color: Colors.black,
                          ),
                        ],
                      ),

                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: GridView.count(
                          primary: false,
                          childAspectRatio: (itemWidth / itemHeight),
                          padding: const EdgeInsets.all(10),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 5,
                          children: numbers.toList()),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xfffec612),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xfff71518),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),

                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffc81b9b),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'DEL',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xff1b4aa2),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                        child: Center(
                                          child: Text(
                                            'ENT',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),


                      ],
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ),
      ],
    );
  }

  Widget getPointsTV() {
    switch (onscreen) {
      case 0:
        {
          return _overview();
        }
        break;

      case 1:
        {
          return _level();
        }
        break;
      case 2:
        {
          return _points();
        }
        break;
      case 3:
        {
          return _progress();
        }
        break;
      case 4:
        {
          return _dailyGoal();
        }
        break;

      default:
        {
          return _overview();
        }
        break;
    }
  }

  Widget _progress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "<<",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      color: Color(0xfffafafa),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    onscreen = 0;
                  });
                },
              ),
              Text(
                "Progress",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Text(
            "-----------------------",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 2.0, color: Colors.white),
                  bottom: BorderSide(width: 2.0, color: Colors.white),
                ),
                color: Color(0xff1d2a33),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "3000",
                          style: TextStyle(
                            fontFamily: 'VT323',
                            color: Color(0xffffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          height: 38,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            border: Border.all(
                              color: Color(0xff707070),
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dailyGoal() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "<<",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      color: Color(0xfffafafa),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    onscreen = 0;
                  });
                },
              ),
              Text(
                "Daily Goal",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Text(
            "-----------------------",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text("Enter your Daily Goal:",
              style: TextStyle(
                fontFamily: 'VT323',
                color: Color(0xffffffff),
                fontSize: 31,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Center(
            child: Text(appState.currentUser.dailygoal.toString(),
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xffffffff),
                  fontSize: 68,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),

          ),
          Center(
            child: Text("--------",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xffffffff),
                  fontSize: 31,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),)
        ],
      ),
    );
  }

  Widget _points() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "<<",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      color: Color(0xfffafafa),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    onscreen = 0;
                  });
                },
              ),
              Text(
                "Points",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Text(
            "-----------------------",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 284,
                      height: 30,
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(
                          color: Color(0xff707070),
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: appState.currentUser.points * 284 / 30000,
                      height: 30,
                      decoration: new BoxDecoration(
                        color: Color(0xff26cf31),
                        border: Border.all(
                          color: Color(0xff707070),
                          width: 1,
                        ),
                      ),
                    ),

                    Container(
                      width: 284,
                      height: 30,
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: Color(0xff707070),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        //alignment: Alignment.center,
                          child: Text(
                            appState.currentUser.points.toString(),
                            style: TextStyle(
                              fontFamily: 'VT323',
                              color: Colors.black,
                              fontSize: 31,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "0",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xffffffff),
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      "30000",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xffffffff),
                        fontSize: 31,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _level() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "<<",
                    style: TextStyle(
                      fontFamily: 'VT323',
                      color: Color(0xfffafafa),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    onscreen = 0;
                  });
                },
              ),
              Text(
                "Level",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Text(
            "-----------------------",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Center(
            child: Image.asset("assets/level/8bitcup_" + appState.currentUser.level.toString() + ".png"),
          ),
        ],
      ),
    );
  }

  Widget _overview() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "SABAWA",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            "-----------------------",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xfffafafa),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "*",
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: GestureDetector(
                    child: Text(
                      "Level",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        onscreen = 1;
                      });
                    },
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  appState.currentUser.level.toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  " ",
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: GestureDetector(
                    child: Text(
                      "Points",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        onscreen = 2;
                      });
                    },
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  appState.currentUser.points.toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  " ",
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: GestureDetector(
                    child: Text(
                      "Weekly Hi-Score",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        onscreen = 3;
                      });
                    },
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  "0",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  " ",
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: GestureDetector(
                    child: Text(
                      "Daily Goal",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        onscreen = 4;
                      });
                    },
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  "0",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'VT323',
                    color: Color(0xfffafafa),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Container> numbers = <Container>[

    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '2',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '3',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '4',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '5',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '6',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '7',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '8',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '9',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '0',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
  ];

  List<Container> keyboard = <Container>[
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'A',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'B',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'C',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'D',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'E',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'F',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'G',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'H',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'I',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'J',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'K',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'L',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'M',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'N',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'O',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'P',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Q',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'R',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'S',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'T',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'U',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'V',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'W',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'X',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Y',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Z',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '.',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        ',',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '!',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '?',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '0',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '2',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '3',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '4',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '5',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '6',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '7',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '8',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '9',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
  ];
}
