import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/title_item.dart';
import 'package:sabawa/ui/widgets/shop_item.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Image.asset("assets/nav/star.png",
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
              child: Image.asset("assets/nav/gold.png",
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

//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(50.0),
//          child:  Container(
//              height: 50.0,
//              alignment: Alignment.centerLeft,
//              color: Color(0xFF432d2d),
//              //child: TitleItem(title: "SHOPPING MALL",)
//            child: Padding(
//              padding: EdgeInsets.only(left: 15.0),
//              child: Text(
//                "SHOPPING MALL",
//                style: TextStyle(
//                  fontFamily: 'Montserrat',
//                  color: Colors.white,
//                  fontSize: 25,
//                  fontWeight: FontWeight.w900,
//                  fontStyle: FontStyle.normal,
//                ),
//              ),
//            )
//
//            ),
//          ),
//

      ),

      body: _shop()
    );
  }

  Widget _shop() {
    return Container(
      decoration: new BoxDecoration(
        color: Color(0xfff3f2dd),
      ),
      child: ListView(
        children: <Widget>[
          ShopItem(),
        ],
      ),
    );
  }

  Widget _insertCoin() {
    return Container(
        decoration: new BoxDecoration(
            color: Color(0xff432d2d),
        ),
      child: Center(
        child: Text("INSERT COIN",
            style: TextStyle(
              fontFamily: 'VT323',
              color: Color(0xffffda2d),
              fontSize: 50,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
        ),
      ),
    );
  }

}
