import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Android Mobile – 6
      Container(
          width: 360,
          height: 640,
          decoration: BoxDecoration(
              color: const Color(0xffffffff)
          ),
          child: Stack(children: [
            // Rechteck 1
            PositionedDirectional(
              top: 0,
              start: 0,
              child:
              Container(
                  width: 360,
                  height: 640,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xff432d2d)
                  )
              ),
            ),
            // Rechteck 2
            PositionedDirectional(
              top: 119,
              start: 0,
              child:
              Container(
                  width: 360,
                  height: 521,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xfff3f2dd)
                  )
              ),
            ),
            // favourite
            PositionedDirectional(
              top: 5,
              start: 219,
              child:
              Container(
                  width: 25,
                  height: 25
              ),
            ),
            // gold
            PositionedDirectional(
              top: 5,
              start: 320,
              child:
              Container(
                  width: 25,
                  height: 25
              ),
            ),
            // gold
            PositionedDirectional(
              top: 83,
              start: 16,
              child:
              Container(
                  width: 25,
                  height: 25
              ),
            ),
            // tape
            PositionedDirectional(
              top: 5,
              start: 117,
              child:
              Container(
                  width: 25,
                  height: 25
              ),
            ),
            // forehead-bandana
            PositionedDirectional(
              top: 5,
              start: 16,
              child:
              Container(
                  width: 25,
                  height: 25
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 0,
              child:
              SizedBox(
                  width: 261,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xff9b269b),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 0,
              child:
              SizedBox(
                  width: 265,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xffc81b9b),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 0,
              child:
              SizedBox(
                  width: 269,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xffec0672),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 3,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xfff71518),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 7,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xfffb431c),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 11,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xfffe781b),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 15,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xfffca318),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 19,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xfffec612),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // SHOPPING MALL
            PositionedDirectional(
              top: 40,
              start: 23,
              child:
              SizedBox(
                  width: 270,
                  height: 33,
                  child:   Text(
                      "SHOPPING MALL",
                      style: const TextStyle(
                          color:  const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // Rechteck 134
            PositionedDirectional(
              top: 144,
              start: 15,
              child:
              Container(
                  width: 330,
                  height: 117,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xff3a3939)
                  )
              ),
            ),
            // 4000
            PositionedDirectional(
              top: 86,
              start: 46,
              child:
              SizedBox(
                  width: 47,
                  height: 20,
                  child:   Text(
                      "4000",
                      style: const TextStyle(
                          color:  const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat",
                          fontStyle:  FontStyle.normal,
                          fontSize: 17.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // ERA SHOP
            PositionedDirectional(
              top: 152,
              start: 23,
              child:
              SizedBox(
                  width: 220,
                  height: 39,
                  child:   Text(
                      "ERA SHOP",
                      style: const TextStyle(
                          color:  const Color(0xfff71518),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Backtothefuture2002",
                          fontStyle:  FontStyle.normal,
                          fontSize: 35.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // >
            PositionedDirectional(
              top: 124,
              start: 245,
              child:
              SizedBox(
                  width: 96,
                  height: 96,
                  child:   Text(
                      ">",
                      style: const TextStyle(
                          color:  const Color(0xfff71518),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Backtothefuture2002",
                          fontStyle:  FontStyle.normal,
                          fontSize: 86.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // Rechteck 135
            PositionedDirectional(
              top: 194,
              start: 15,
              child:
              Container(
                  width: 110,
                  height: 67,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xffffffff)
                  )
              ),
            ),
            // Rechteck 136
            PositionedDirectional(
              top: 194,
              start: 125,
              child:
              Container(
                  width: 110,
                  height: 67,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xfffdd303)
                  )
              ),
            ),
            // Rechteck 137
            PositionedDirectional(
              top: 194,
              start: 235,
              child:
              Container(
                  width: 110,
                  height: 67,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 1
                      ),
                      color: const Color(0xffffffff)
                  )
              ),
            ),
            // Bild 6
            PositionedDirectional(
              top: 195,
              start: 16,
              child:
              Opacity(
                opacity : 0.4699999988079071,
                child:   Container(
                    width: 108,
                    height: 65
                ),
              ),
            ),
            // 60
            PositionedDirectional(
              top: 209,
              start: 45,
              child:
              SizedBox(
                  width: 33,
                  height: 42,
                  child:   Text(
                      "60",
                      style: const TextStyle(
                          color:  const Color(0xff717424),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Flames",
                          fontStyle:  FontStyle.normal,
                          fontSize: 41.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // Bild 7
            PositionedDirectional(
              top: 195,
              start: 236,
              child:
              Container(
                  width: 108,
                  height: 65
              ),
            ),
            // 8 0 s
            PositionedDirectional(
              top: 207.48416137695312,
              start: 254.46435546875,
              child:
              SizedBox(
                  width: 72.0712890625,
                  height: 40.031707763671875,
                  child:   Text(
                      "8 0 s",
                      style: const TextStyle(
                          color:  const Color(0xffe540f1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "lazer84",
                          fontStyle:  FontStyle.normal,
                          fontSize: 30.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // 70s
            PositionedDirectional(
              top: 195,
              start: 126,
              child:
              Container(
                  width: 108,
                  height: 65
              ),
            ),
            // 70s
            PositionedDirectional(
              top: 201,
              start: 149,
              child:
              SizedBox(
                  width: 63,
                  height: 48,
                  child:   Text(
                      "70s",
                      style: const TextStyle(
                          color:  const Color(0xff348537),
                          fontWeight: FontWeight.w400,
                          fontFamily: "CandiceRUSBYmyversion",
                          fontStyle:  FontStyle.normal,
                          fontSize: 42.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            ),
            // s
            PositionedDirectional(
              top: 223,
              start: 78,
              child:
              SizedBox(
                  width: 10,
                  height: 25,
                  child:   Text(
                      "s",
                      style: const TextStyle(
                          color:  const Color(0xff717424),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Flames",
                          fontStyle:  FontStyle.normal,
                          fontSize: 24.0
                      ),
                      textAlign: TextAlign.left
                  )
              ),
            )
          ])
      ),
    );
  }
}