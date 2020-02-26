import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/google_sign_in_button.dart';
import 'package:sabawa/state_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    BoxDecoration _buildBackground() {
//      return BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage("assets/caique-silva-481033-unsplash.jpg"),
//          fit: BoxFit.cover,
//        ),
//      );
//    }

    Text _buildText() {
      return Text(
        'SABAWA',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xff432d2d),
        ),
        //decoration: _buildBackground(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LET'S GET",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xffffffff),
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
              ),
              _started(),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Container(
                  width: 222.0,
                  child: FlatButton(
                    onPressed: () {
                      StateWidget.of(context).signInWithGoogle();
                      //Navigator.pushReplacementNamed(context, '/');
                      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/nav/star.png",
                            width: 25.0,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff432d2d),
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 25.0,
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Container(
                  width: 222.0,
                  child: FlatButton(
                    onPressed: () {
//                      StateWidget.of(context).signInWithGoogle();
//                      Navigator.pushNamed(context, '/');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            "assets/nav/star.png",
                            width: 25.0,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff432d2d),
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 25.0,
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),

//              SizedBox(height: 50.0),
//              // Passing function callback as constructor argument:
//              GoogleSignInButton(
//                onPressed: () {
//                  StateWidget.of(context).signInWithGoogle();
//                  Navigator.pushNamed(context, '/');
//                }
//              ),// New code
            ],
          ),
        ),
      ),
    );
  }

  Widget _started() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "STARTED",
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xff03a6dd),
              fontSize: 45,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 65.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff0094cc),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff046fb5),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 55.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff1b4aa2),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff333099),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 45.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff6b2b9b),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xff9b269b),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffc81b9b),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffec0672),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfff71518),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffb431c),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffe781b),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffca318),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: new Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xfffec612),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: Text("STARTED",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Color(0xffffffff),
                fontSize: 45,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              )),
        ),
      ],
    );
  }
}
