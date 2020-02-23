import 'package:flutter/material.dart';

class AchievementItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//        height: 124,
//        decoration: new BoxDecoration(
//            color: Color(0xffffffff),
//            border: Border.all(
//                color: Color(0xff707070),
//                width: 1
//            )
//        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/ach.jpg",
                height: 108,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "HERO",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff000000),
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    "One Week every",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    "Day 1 Task done",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          "assets/nav/star.png",
                          height: 25,
                        ),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
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
    );
  }
}
