import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Container(
          width: 348,
          height: 68,
          decoration: new BoxDecoration(
          ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"),
              radius: 60.0,
            ),
            new Text("WILKE SCHOON",
                style: TextStyle(
                  fontFamily: 'lazer84',
                  color: Color(0xff29196a),
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,


                ),
            ),

          ],
        ),
      ),

    );
  }

}