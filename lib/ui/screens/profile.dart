import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';
import 'package:sabawa/ui/widgets/points_appbar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: PointsAppBar(color: Color(0xff310818)),
        ),
        body: Container(
          width: double.maxFinite,
          decoration: new BoxDecoration(
            color: Color(0xff310818),
          ),
          child: Column(
            children: <Widget>[
              _buildAvatar(),
              _neonText(appState.user.displayName.split(" ").first, Color(0xffff3988), 39.0),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              GestureDetector(
                child: _neonSign("FRIENDS", Color(0xff026af4), Icons.people_outline),
                onTap: () {
                  //Navigator.pushNamed(context, route);
                },
              ),
              GestureDetector(
                child: _neonSign("DESIGN", Color(0xfffbeb10), Icons.favorite_border),
                onTap: () {
                  Navigator.pushNamed(context, "/design");
                },
              ),
              GestureDetector(
                child: _neonSign("SETTINGS", Color(0xff5fef5f), Icons.settings),
                onTap: () {
                  Navigator.pushNamed(context, "/settings");
                },
              ),





              //_buildAvatar(),
              //_buildUserInfo(),
              //_buildButtons(),
            ],
          ),
        ));
  }

  Widget _neonSign(String text, Color color, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child:  Container(
        width: 304,
        height: 60,
        decoration: new BoxDecoration(
          border: Border.all(color: color, width: 3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color,
              offset: Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xff310818),
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _neonText(text, color, 34),
                Stack(
                  //fit: StackFit.expand,
                  children: <Widget>[
                    Center(
                      child: Icon(icon, size: 50, color: color ),
                    ),
                    Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(icon, size: 30, color: color ),
                        )
                    ),
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3.0,
                            sigmaY: 3.0,
                          ),
                          child: Container(

                              alignment: Alignment.center,
                              width: 50.0,
                              height: 50.0,
                              child: Center(
                                child: Icon(icon, size: 40, color: color.withOpacity(0.6) ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),),
      )
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: CircleAvatar(
        //backgroundImage: AssetImage("assets/avatar.png"),
        backgroundImage: new NetworkImage(appState.user.photoUrl),
        radius: 50.0,
      ),
    );
  }


  Widget _neonText(String text, Color color, double fontSize) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Beon',
            color: color.withOpacity(0.1),
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            shadows: [
              BoxShadow(
                  color: color,
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0),
            ],
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Beon',
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            shadows: [
              BoxShadow(
                color: color,
                offset: Offset(0, 0),
                blurRadius: 9,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return new Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    appState.user.displayName.split(" ").first,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 50.0,
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
                shape: new CircleBorder(),
                elevation: 5.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
                shape: new CircleBorder(),
                elevation: 5.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.mail_outline,
                      color: Colors.green,
                      size: 50.0,
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
                shape: new CircleBorder(),
                elevation: 5.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.free_breakfast,
                      color: Colors.amber,
                      size: 50.0,
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ],
                ),
                shape: new CircleBorder(),
                elevation: 5.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: RawMaterialButton(
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.event_note,
                      color: Colors.red,
                      size: 50.0,
                    ),
                    Text(
                      "Calender",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ],
                ),
                shape: new CircleBorder(),
                elevation: 5.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCards(String title, IconData icon, String route) {
    Card _buildCard() {
      return Card(
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.1),
              leading: Icon(icon, color: Colors.white),
              title: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      );
    }

    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, route), child: _buildCard()
//      child: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 3.0),
//        child: Card(
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              _buildCard(),
//            ],
//          ),
//        ),
//      ),
        );
  }
}
