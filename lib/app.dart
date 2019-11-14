import 'package:flutter/material.dart';

import 'package:sabawa/ui/theme.dart';
import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/controller/tab_controller.dart';

class SabawaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sabawa',
      theme: buildTheme(),
      routes: {
        '/': (context) => SabawaTabController(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}