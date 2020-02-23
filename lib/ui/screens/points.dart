import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/points_tv.dart';

class Points extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = 2;
    final double itemWidth = 2;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff7f4418),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xffa4622b),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xff1d2a33),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: PointsTV(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xff7f4418),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xff41322f),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffb2b2b2),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: Color(0xff434040),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: Color(0xff434040),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            decoration: new BoxDecoration(
                              color: Color(0xff434040),
                              border: Border.all(
                                color: Color(0xff707070),
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 30,
                        height: 15,
                        decoration: new BoxDecoration(
                          color: Color(0xff434040),
                          border: Border.all(
                            color: Color(0xff707070),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xfff3f2dd),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: Color(0xffcdcdce),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xff3a393e),
                  border: Border.all(
                    color: Color(0xff707070),
                    width: 1,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 90,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: GridView.count(
                          primary: false,
                          childAspectRatio: (itemWidth / itemHeight),
                          padding: const EdgeInsets.all(15),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 5,
                          children: numbers.toList()),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xfffec612),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xfff71518),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffc81b9b),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffbdbabb),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      decoration: new BoxDecoration(
                                        color: Color(0xff1b4aa2),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Color(0xff707070),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

//              Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 2,
//                    child: GridView.count(
//                        primary: false,
//                        childAspectRatio: (itemWidth / itemHeight),
//                        padding: const EdgeInsets.all(15),
//                        crossAxisSpacing: 5,
//                        mainAxisSpacing: 5,
//                        crossAxisCount: 8,
//                        children: keyboard.toList()),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Column(
//                      children: <Widget>[
//                        Icon(
//                          Icons.add,
//                          color: Colors.black,
//                          size: 70,
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xfffec612),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xfff71518),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xffc81b9b),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.only(right: 10.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 35,
//                                    height: 35,
//                                    decoration: new BoxDecoration(
//                                        color: Color(0xffbdbabb),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                        borderRadius: BorderRadius.circular(3)),
//                                  ),
//                                  Positioned.fill(
//                                    child: Container(
//                                      margin: EdgeInsets.all(2.0),
//                                      decoration: new BoxDecoration(
//                                        color: Color(0xff1b4aa2),
//                                        borderRadius: BorderRadius.circular(30),
//                                        border: Border.all(
//                                          color: Color(0xff707070),
//                                          width: 1,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Container> numbers = <Container>[
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '0',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '2',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '3',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '4',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '5',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '6',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '7',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '8',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '9',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
  ];

  List<Container> keyboard = <Container>[
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'A',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'B',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'C',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'D',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'E',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'F',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'G',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'H',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'I',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'J',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'K',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'L',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'M',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'N',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'O',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'P',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Q',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'R',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'S',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'T',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'U',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'V',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'W',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'X',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Y',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        'Z',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '.',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        ',',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '!',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '?',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '0',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '2',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '3',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '4',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '5',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '6',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '7',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '8',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '9',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: Text(
        '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      color: Colors.white,
    ),
  ];
}
