import 'package:flutter/material.dart';

import 'package:sabawa/ui/widgets/achievement_item.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 360,
      //height: 521,
      decoration: new BoxDecoration(
        color: Color(0xfff3f2dd),
      ),
      child: ListView(
        children: <Widget>[
          AchievementItem()

        ],
      ),
    );

  }

}