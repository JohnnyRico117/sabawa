import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

class DetailTodo extends StatefulWidget {

  final String taskID;
  //final String projectID;

  DetailTodo(this.taskID);

  @override
  _DetailTodoState createState() => _DetailTodoState();
}

class _DetailTodoState extends State<DetailTodo> {

  StateModel appState;

  final _biggerFont = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Scaffold(
//      appBar: AppBar(),
      backgroundColor: Color(0xFF0050a1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(15.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    //color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0x110000FF)
                    ),
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }

}