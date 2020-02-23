import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:gradient_text/gradient_text.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 330,
            height: 60,
            decoration: new BoxDecoration(
              color: Color(0xff3a3939),
              //border: Border.all(color: Color(0xff707070), width: 1),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 20.0,
                  top: 12.0,
                  child: Text(
                      "ERA SHOP",
                    style: TextStyle(
                        fontFamily: 'BTTF',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 30),
                            const Offset(0, 70),
                            <Color>[
                              Colors.red,
                              Colors.yellow,
                            ],
                          )
                    ),
                  )

//                  child: GradientText(
//                    "ERA SHOP",
//                    gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [Colors.red, Colors.yellow],
//                    ),
//                    style: TextStyle(
//                      fontFamily: 'BTTF',
//                      fontSize: 30,
//                      fontWeight: FontWeight.w400,
//                      fontStyle: FontStyle.normal,
//                    ),
//                  ),
                ),
                Positioned(
                  left: 210.0,
                  bottom: 10.0,
                  child: Container(
                    width: 200.0,
                    height: 60.0,
                    child: Text(
                      ">",
                      style: TextStyle(
                          fontFamily: 'BTTF',
                          fontSize: 70,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          foreground: Paint()
                            ..shader = ui.Gradient.linear(
                              const Offset(0, 30),
                              const Offset(0, 70),
                              <Color>[
                                Colors.red,
                                Colors.yellow,
                              ],
                            )
                      ),
                    ),


//                    child: GradientText(
//                      ">",
//                      gradient: LinearGradient(
//                        begin: Alignment(0.0, 0.01),
//                        end: Alignment.bottomCenter,
//                        colors: [Colors.red, Colors.yellow],
//                      ),
//                      style: TextStyle(
//                        fontFamily: 'BTTF',
//                        fontSize: 70,
//                        fontWeight: FontWeight.w400,
//                        fontStyle: FontStyle.normal,
//                      ),
//                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      "assets/flower.png",
                      width: 110,
                      height: 67,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "60s",
                        style: TextStyle(
                          fontFamily: 'Flames',
                          color: Color(0xff717424),
                          fontSize: 41,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/70s.png",
                      width: 110,
                      height: 67,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("70s",
                            style: TextStyle(
                              fontFamily: 'CandiceRusby',
                              color: Color(0xff348537),
                              fontSize: 42,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/retro_2.png",
                      width: 110,
                      height: 67,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "8 0 s",
                        style: TextStyle(
                          fontFamily: 'lazer84',
                          color: Color(0xffe540f1),
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
