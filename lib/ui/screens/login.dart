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
        //decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(height: 50.0),
              // Passing function callback as constructor argument:
              GoogleSignInButton(
                onPressed: () {
                  StateWidget.of(context).signInWithGoogle();
                  Navigator.pushNamed(context, '/');
                }
              ),// New code
            ],
          ),
        ),
      ),
    );
  }
}