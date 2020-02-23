import 'package:flutter/material.dart';

class PointsTV extends StatefulWidget {
  @override
  _PointsTVState createState() => _PointsTVState();
}

class _PointsTVState extends State<PointsTV> {
  @override
  Widget build(BuildContext context) {
    return _progress();
  }

  Widget _progress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                  ),Expanded(
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
                  ),Expanded(
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
                  ),Expanded(
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
                  ),Expanded(
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
                      height: 16,
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(
                          color: Color(0xff707070),
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: 211,
                      height: 16,
                      decoration: new BoxDecoration(
                        color: Color(0xff26cf31),
                        border: Border.all(
                          color: Color(0xff707070),
                          width: 1,
                        ),
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
            child: Image.asset("assets/level/8bitcup_1.png"),
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
            Text("SABAWA",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Text("-----------------------",
                style: TextStyle(
                  fontFamily: 'VT323',
                  color: Color(0xfffafafa),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text("*",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 6,
                  child: Text("Level",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Text("1",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(" ",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 6,
                  child: Text("Points",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Text("20000",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(" ",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 6,
                  child: Text("Weekly Hi-Score",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Text("3000",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(" ",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 33,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 6,
                  child: Text("Daily Goal",
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Text("300",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'VT323',
                        color: Color(0xfffafafa),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
