import 'package:flutter/material.dart';

import 'package:sabawa/ui/theme.dart';
import 'package:sabawa/ui/screens/home.dart';

class SabawaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maslooo',
      theme: buildTheme(),
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}