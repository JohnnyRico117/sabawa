import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF432d2d),
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Color(0xfff3f2dd),
            border: Border(bottom: BorderSide(color: Color(0xff707070), width: 1))
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hi Ekaterina,",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xff432d2d),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "If you have some tips how to improve our app or you have some cool ideas, which should be included or you would like to submit your own design, please let us know.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xff432d2d),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "We are thankful for every feedback.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xff432d2d),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: TextField(
                  expands: false,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Let us know, what you think...',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  color: Color(0xff03a6dd),
                    child: Text("SEND",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),),

                    onPressed: () {
                  print("CLICK");
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
