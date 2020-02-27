import 'package:flutter/material.dart';
import 'package:sabawa/state_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:sabawa/ui/theme.dart';
import 'package:sabawa/ui/screens/friend_list.dart';
import 'package:sabawa/ui/screens/design.dart';
import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/ui/screens/profile.dart';
import 'package:sabawa/ui/screens/projects.dart';
import 'package:sabawa/ui/screens/settings.dart';
import 'package:sabawa/ui/screens/overview.dart';
import 'package:sabawa/ui/screens/shopping_mall.dart';
import 'package:sabawa/controller/tab_controller.dart';

void main() => runApp(new StateWidget(
  child: new SabawaApp(),
));

class SabawaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>(
            create: (_) => FirebaseAuth.instance.onAuthStateChanged
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sabawa',
        theme: buildTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => SabawaTabController(),
          '/login': (context) => LoginScreen(),
          '/settings': (context) => Settings(),
          '/profile': (context) => Profile(),
          '/friends': (context) => FriendList(),
          '/projects': (context) => Projects(),
          '/overview': (context) => Overview(),
          '/design': (context) => Design(),
          '/shop': (context) => Shop(),
        },
      ),
    );
  }
}