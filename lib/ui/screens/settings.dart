import 'package:flutter/material.dart';

import 'package:sabawa/state_widget.dart';
import 'package:sabawa/model/state.dart';

import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/ui/widgets/settings_button.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  Widget _buildContent() {
    if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
    } else {
      return _settingContent();
    }
  }

  Widget _settingContent() {
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
                  "SETTINGS",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
//            _settingsItem("Upgrade to Premium", Icons.star_border, () {
//              print("Upgrade");
//            }),
            _settingsItem("Notifications", Icons.notifications_none, () {
              print("Notifications");
            }),
//            _settingsItem("Help", Icons.help_outline, () {
//            print("Help");
//            }),
            _settingsItem("Info", Icons.info_outline, () {
              print("Info");
            }),
            _settingsItem("Logout", Icons.exit_to_app, () async {
              await StateWidget.of(context).signOutOfGoogle();
            },),
          ],
        )
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          SettingsButton(
//            Icons.exit_to_app,
//            "Log out",
//            appState.user.displayName,
//                () async {
//              await StateWidget.of(context).signOutOfGoogle();
//            },
//          ),
//        ],
//      ),
        );
  }

  Widget _settingsItem(String text, IconData icon, Function onTap) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
        //padding: EdgeInsets.all(10.0),
        width: 350,
        height: 50,
        decoration: new BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color: Color(0xff707070), width: 2)),
        child: Align(
          //alignment: Alignment.centerLeft,
          child:  Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border(
                    right: BorderSide(color: Color(0xff707070), width: 2),
                  ),
                ),
                child: Center(
                  child: Icon(icon),
                )
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff292525),
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,


                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
