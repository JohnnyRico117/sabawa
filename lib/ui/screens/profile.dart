import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return new Container(
      padding: const EdgeInsets.all(12),
      child: new Column(
        children: <Widget>[
          _buildPoints(),
          _buildPoints(),
          _buildPoints()
        ],
      )
    );
  }

  Widget _buildAvatar() {
    return new CircleAvatar(
      backgroundImage: appState.user.photoUrl == null ? null : new NetworkImage(appState.user.photoUrl),
      radius: 50.0,
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
                            appState.user.displayName == null ? "" : appState.user.displayName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.yellow),
                          Container(
                              padding: const EdgeInsets.only(left: 8),
                              //child: Text(appState.points.toString())
                              child: Text(appState.currentUser.points == null ? "" : appState.currentUser.points.toString())
                          )
                        ],
                      ),
                    ),
                  ],
                )
            )
          ],
        )
    );
  }

  Widget _buildCards(String title, IconData icon, String route) {
    Card _buildCard() {
      return Card(
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 0.1),
              leading: Icon(icon, color: Colors.white),

              title: Text(
                title,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPoints() {
    return Row(
      children: <Widget>[
        CircularPercentIndicator(
          progressColor: Colors.green,
          radius: 90.0,
          percent: 0.4,
          lineWidth: 10.0,
          center: Text("40%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Text("Tasks: 20"),
            Text("Already done: 2"),
            Text("Points: 2000")
          ],
        )

      ]
    );
  }

}