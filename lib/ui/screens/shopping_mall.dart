import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/title_item.dart';
import 'package:sabawa/ui/widgets/shop_item.dart';

import 'package:sabawa/model/state.dart';
import 'package:sabawa/state_widget.dart';

import 'package:sabawa/ui/widgets/points_appbar.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: PointsAppBar(color: Color(0xff432d2d)),
        ),

      body: appState.currentUser.coins == 0 ? _insertCoin() : _shop()
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
