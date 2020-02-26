import 'package:flutter/material.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';

class PointsTV extends StatefulWidget {
  @override
  _PointsTVState createState() => _PointsTVState();
}

class _PointsTVState extends State<PointsTV> {
  int onscreen;
  StateModel appState;

  @override
  void initState() {
    super.initState();
    onscreen = 0;
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
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
            child: Text("200",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xffffffff),
                  fontSize: 68,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          )
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
                      width: appState.currentUser.points * 2.84,
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
}
