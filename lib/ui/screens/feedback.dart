import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/ui/widgets/points_appbar.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackScreen> {
  StateModel appState;

  String _feedback = "";
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = new FocusNode();
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: PointsAppBar(color: Color(0xff432d2d)),
      ),
        body: GestureDetector(
          child: Container(
            decoration: new BoxDecoration(
                color: Color(0xfff3f2dd),
                border: Border(
                    bottom: BorderSide(color: Color(0xff707070), width: 1))),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi " + appState.user.displayName.split(" ").first + ",",
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
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        focusNode: _focusNode,
                        expands: false,
                        maxLines: 6,
                        controller: _controller,
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some feedback before pressing the button';
                          } else {
                            setState(() {
                              _feedback = value;
                            });
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                        color: Color(0xff03a6dd),
                        child: Text(
                          "SEND",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            DocumentReference docRef = Firestore.instance
                                .collection('feedback')
                                .document();
                            docRef.setData({
                              'id': appState.user.uid,
                              'name': appState.user.displayName,
                              'email': appState.user.email,
                              'feedback': _feedback
                            });
                          }
                          _controller.clear();
                          FocusScope.of(context).unfocus();
                        }),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        ),
    );
  }
}
