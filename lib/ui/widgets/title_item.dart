import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
//        Positioned(
//          right: MediaQuery.of(context).size.width - 258.0,
//          child: new Text(
//            title,
//            style: TextStyle(
//              fontFamily: 'Montserrat',
//              color: Color(0xff333099),
//              fontSize: 30,
//              fontWeight: FontWeight.w900,
//              fontStyle: FontStyle.normal,
//            ),
//          ),
//        ),
//        Positioned(
//          right: MediaQuery.of(context).size.width - 261.0,
//          child: new Text(
//            title,
//            style: TextStyle(
//              fontFamily: 'Montserrat',
//              color: Color(0xff6b2b9b),
//              fontSize: 30,
//              fontWeight: FontWeight.w900,
//              fontStyle: FontStyle.normal,
//            ),
//          ),
//        ),
//        Positioned(
//          right: MediaQuery.of(context).size.width - 264.0,
//          child: new Text(
//            title,
//            style: TextStyle(
//              fontFamily: 'Montserrat',
//              color: Color(0xff9b269b),
//              fontSize: 30,
//              fontWeight: FontWeight.w900,
//              fontStyle: FontStyle.normal,
//            ),
//          ),
//        ),
//        Positioned(
//          right: MediaQuery.of(context).size.width - 267.0,
//          child: new Text(
//            title,
//            style: TextStyle(
//              fontFamily: 'Montserrat',
//              color: Color(0xffc81b9b),
//              fontSize: 30,
//              fontWeight: FontWeight.w900,
//              fontStyle: FontStyle.normal,
//            ),
//          ),
//        ),
      Padding(
      padding: EdgeInsets.only(left: 0.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffec0672),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left: 3.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfff71518),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left: 6.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffb431c),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left: 9.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffe781b),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left: 12.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffca318),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left:  15.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffec612),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),

        ],


    );
  }
}
