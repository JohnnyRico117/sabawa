import 'package:flutter/material.dart';

class Design extends StatelessWidget {
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
              height: 50.0,
              alignment: Alignment.centerLeft,
              color: Color(0xFF432d2d),
              //child: TitleItem(title: "SHOPPING MALL",)
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  "DESIGN > ERA",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _designItem("To-Do List"),
          _designItem("Points"),
          _designItem("Profile"),
          _selectItem("60s", true),
          _selectItem("70s", false)
        ],
      ),
    );
  }

  Widget _designItem(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
      padding: EdgeInsets.all(10.0),
      width: 350,
      height: 70,
      decoration: new BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(color: Color(0xff707070), width: 2)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xff292525),
            fontSize: 37,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  Widget _selectItem(String text, bool state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
      width: 350,
      height: 70,
      decoration: new BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(color: Color(0xff707070), width: 2)),
      child: Align(
          //alignment: Alignment.centerLeft,
          child: Row(
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              border: Border(
                right: BorderSide(color: Color(0xff707070), width: 2),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 33,
                  width: 70,
                  child: FlatButton(
                    child: Text("ON"),
                    color: state ? Colors.green : Colors.white,
                    onPressed: () {
                      print("ON");
                    },
                  ),
                ),
                Container(
                  height: 33,
                  width: 70,
                  child: FlatButton(
                    child: Text("OFF"),
                    color: state ? Colors.white : Colors.red,
                    onPressed: () {
                      print("OFF");
                    },
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff292525),
                fontSize: 37,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      )),
    );
  }
}
