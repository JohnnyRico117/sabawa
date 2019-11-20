import 'package:flutter/material.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatefulWidget {

  final String kind;

  ProgressCard(this.kind);

  @override
  _ProgressCardState createState() => _ProgressCardState();

}

class _ProgressCardState extends State<ProgressCard> {

  StateModel appState;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    appState = StateWidget.of(context).state;

    return Card(
        child: Container(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          widget.kind,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        )
                    ),
                    Row(
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
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      top: 5.0,
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 5.0),
                                                        child: Icon(
                                                          Icons.assignment,
                                                          color: Colors.blue,
                                                        )
                                                    )
                                                ),
                                                TextSpan(
                                                  style: TextStyle(
                                                    wordSpacing: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                  text: "Tasks:",
                                                ),
                                              ]
                                          )
                                      ),
                                      Text(
                                        "200/3000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      top: 5.0,
                                      bottom: 5.0
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 5.0),
                                                        child: Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                        )
                                                    )
                                                ),
                                                TextSpan(
                                                  style: TextStyle(
                                                    wordSpacing: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                  text: "Points:",
                                                ),
                                              ]
                                          )
                                      ),
                                      Text(
                                        "200/3000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      top: 5.0,
                                      bottom: 5.0
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 5.0),
                                                        child: Icon(
                                                          Icons.error,
                                                          color: Colors.red,
                                                        )
                                                    )
                                                ),
                                                TextSpan(
                                                  style: TextStyle(
                                                    wordSpacing: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                  text: "Missed:",
                                                ),
                                              ]
                                          )
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                    )
                  ],
                )
            )
        )
    );
  }
}