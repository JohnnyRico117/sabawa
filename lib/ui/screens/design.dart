import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/retro_radio_button_column.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {


  Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = _era();
  }

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
                  "DESIGN",
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
      body: _currentScreen,
    );
  }

  void _returnScreen(DesignScreen designScreen, [String era]) {
    switch(designScreen) {
      case DesignScreen.era:
        setState(() {
          _currentScreen = _era();
        });
        break;
      case DesignScreen.this_era:
        setState(() {
          _currentScreen = _thisEra(era);
        });
        break;
      case DesignScreen.era_todo:
        setState(() {
          _currentScreen = _todo(designScreen,era);
        });
        break;
      case DesignScreen.era_points:
        setState(() {
          _currentScreen = _points(designScreen,era);
        });
        break;
      case DesignScreen.era_profile:
        setState(() {
          _currentScreen = _profile(designScreen,era);
        });
        break;
      case DesignScreen.era_friends:
        setState(() {
          _currentScreen = _friendListDesign(designScreen,era);
        });
        break;

      case DesignScreen.profile_name:
        setState(() {
          _currentScreen = _profileName(designScreen,era);
        });
        break;
      case DesignScreen.profile_friends_sign:
        setState(() {
          _currentScreen = _thisSign(designScreen,era);
        });
        break;
      case DesignScreen.profile_design_sign:
        setState(() {
          _currentScreen = _thisSign(designScreen,era);
        });
        break;
      case DesignScreen.profile_settings_sign:
        setState(() {
          _currentScreen = _thisSign(designScreen,era);
        });
        break;
      case DesignScreen.sign_color:
        // TODO: Handle this case.
        break;
      case DesignScreen.sign_font:
        // TODO: Handle this case.
        break;
      case DesignScreen.sign_icon:
        // TODO: Handle this case.
        break;
    }
  }

  Widget _era() {
    return ListView(
      children: <Widget>[
        _eraSelectItem("60s", false),
        _eraSelectItem("70s", false),
        _eraSelectItem("80s", true)
      ],
    );
  }

  Widget _thisEra(String era) {
    return ListView(
      children: <Widget>[
        _designItem(DesignScreen.era_todo, era, "To-Do List"),
        //_designItem(DesignScreen.era_points, era,"Points"),
        _designItem(DesignScreen.era_profile, era,"Profile"),
        _designItem(DesignScreen.era_friends, era,"Friends"),
      ],
    );
  }

  Widget _todo(DesignScreen designScreen, String era) {
    return ListView(
      children: <Widget>[
        _designItem(designScreen, era, ""),
        _designItem(designScreen, era, ""),
      ],
    );
  }

  Widget _points(DesignScreen designScreen, String era) {
    return ListView(
      children: <Widget>[
        _designItem(designScreen, era, "TV"),
        _designItem(designScreen, era, "Remote"),
        _designItem(designScreen, era, "Achievements"),
      ],
    );
  }

  Widget _profile(DesignScreen designScreen, String era) {
    return ListView(
      children: <Widget>[
        _designItem(DesignScreen.profile_name, era, "Profile Name"),
        _designItem(DesignScreen.profile_friends_sign, era, "Friends Sign"),
        _designItem(DesignScreen.profile_design_sign, era, "Design Sign"),
        _designItem(DesignScreen.profile_settings_sign, era, "Settings Sign"),
      ],
    );
  }

  Widget _profileName(DesignScreen designScreen, String era) {

    List<RadioModel> nameData = new List<RadioModel>();
    nameData.add(new RadioModel(false, "Show Full Name"));
    nameData.add(new RadioModel(true, "Show Only First Name"));

    return ListView(
      children: <Widget>[
        _designItem(designScreen, era, "Color"),
        _designItem(designScreen, era, "Font"),
        RetroRadioButtons(nameData),
      ],
    );
  }

  Widget _thisSign(DesignScreen designScreen, String era) {
    return ListView(
      children: <Widget>[
        _designItem(designScreen, era, "Color"),
        _designItem(designScreen, era, "Font"),
        _designItem(designScreen, era, "Icon"),
      ],
    );
  }

  Widget _friendListDesign(DesignScreen designScreen, String era) {
    return ListView(
      children: <Widget>[
        _designItem(designScreen, era, "Background"),
        _designItem(designScreen, era, "Font"),
        _designItem(designScreen, era, "Fontcolor"),
      ],
    );
  }

  Widget _designItem(DesignScreen designScreen, String era, String text) {
    return GestureDetector(
      child: Container(
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
      ),
      onTap: () {
        _returnScreen(designScreen, text);
      },
    );
  }

  Widget _nameSelectItem(String text, bool state) {
    return GestureDetector(
      child: Container(
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)
                        ),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)
                        ),
                        onPressed: () {
                          print("OFF");
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff292525),
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                    ),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),),
      ),
      onTap: () {
        _returnScreen(DesignScreen.this_era, text);
      },
    );
  }

  Widget _eraSelectItem(String text, bool state) {
    return GestureDetector(
      child: Container(
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      ),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      ),
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
        ),),
      ),
      onTap: () {
        _returnScreen(DesignScreen.this_era, text);
      },
    );
  }
}

enum DesignScreen {
  era, this_era, era_todo, era_points, era_profile, era_friends,
  profile_name, profile_friends_sign, profile_design_sign, profile_settings_sign,
  sign_color, sign_font, sign_icon
}
