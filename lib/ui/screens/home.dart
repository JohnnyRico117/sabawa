import 'dart:io';
import 'package:flutter/material.dart';

import 'package:sabawa/state_widget.dart';

import 'package:sabawa/model/state.dart';

import 'package:sabawa/ui/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  @override
  void initState() {
    super.initState();
  }



  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildTabView(
        body: LoadingIndicator(),
      );
    } else {
      return _buildTabView(
        body: _buildTabsContent(),
      );
    }
  }

  DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.home, size: _iconSize)),
                Tab(icon: Icon(Icons.lightbulb_outline, size: _iconSize)),
                Tab(icon: Icon(Icons.lightbulb_outline, size: _iconSize)),
                Tab(icon: Icon(Icons.lightbulb_outline, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }

  TabBarView _buildTabsContent() {
    return TabBarView(
      children: [
        Center(child: Icon(Icons.home)),
        Center(child: Icon(Icons.lightbulb_outline)),
        Center(child: Icon(Icons.lightbulb_outline)),
        Center(child: Icon(Icons.lightbulb_outline)),
        Center(child: Icon(Icons.settings)),
      ],
    );
  }


}