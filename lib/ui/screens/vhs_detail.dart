import 'package:flutter/material.dart';

import 'package:sabawa/ui/shapes/rainbow_corner.dart';

class VHSDetail extends StatefulWidget {
  @override
  _VHSDetailState createState() => _VHSDetailState();
}

class _VHSDetailState extends State<VHSDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF432d2d),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            bottom: 0.0,
            child: Container(
              height: 100.0,
              child: RainbowCorner(),
            ),
          ),
          Center(
            child: Container(
              width: 360,
              height: 377,
              decoration: new BoxDecoration(
                  color: Color(0xff302e2e),
                  border: Border.all(color: Color(0xff707070), width: 1)),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      new Container(
                          width: 17,
                          height: 193,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              color: Color(0xffffffff)
                                  .withOpacity(0.20000000298023224))),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 306,
                        height: 40,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                          color: Color(0xffa9d9b3),
                          border: Border.all(
                            color: Color(0xff707070),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: new Text("Make Design",
                              style: TextStyle(
                                fontFamily: 'PermanentMarker',
                                color: Color(0xff432d2d),
                                fontSize: 29,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        )
                      ),
                      new Container(
                        width: 306,
                        height: 160,
                        decoration: new BoxDecoration(
                          color: Color(0xffffffff),
                          border:
                              Border.all(color: Color(0xff707070), width: 1),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Scrollbar(
                            child: ListView(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text("Info: Make the Design Ready",
                                  style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Color(0xff432d2d),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                width: 290,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 60.0),
                              child: Text("For Sabawa",
                                  style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Color(0xff432d2d),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                width: 290,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child:new Text("Link: Click Me ",
                                style: TextStyle(
                                  fontFamily: 'PermanentMarker',
                                  color: Color(0xff432d2d),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),),

                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                width: 290,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child:new Text("Deadline: Fri, 14.02.2020 ",
                                  style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Color(0xff432d2d),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),),

                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                width: 290,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child:new Text("Duration: 2h",
                                  style: TextStyle(
                                    fontFamily: 'PermanentMarker',
                                    color: Color(0xff432d2d),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),),

                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Container(
                                width: 290,
                                child: Divider(
                                  thickness: 2.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Text("SABAWA Video",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0x44432d2d),
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      new Container(
                          width: 17,
                          height: 193,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: Color(0xffffffff)
                                  .withOpacity(0.20000000298023224)))
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 3,
                top: MediaQuery.of(context).size.height / 7),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  height: 50.0,
                  child: Image.asset(
                    "assets/nav/star.png",
                  ),
                ),
                Text("500",
                    style: TextStyle(
                      fontFamily: 'PermanentMarker',
                      color: Color(0xffffffff),
                      fontSize: 38,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
