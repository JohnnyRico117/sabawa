import 'package:flutter/material.dart';

import 'package:sabawa/state_widget.dart';
import 'package:sabawa/model/state.dart';

import 'package:sabawa/ui/screens/login.dart';
import 'package:sabawa/ui/widgets/settings_button.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }

  Widget _buildContent() {
    if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
    } else {
      return _settingContent();
    }
  }

  Widget _settingContent() {
    return Scaffold (
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingsButton(
            Icons.exit_to_app,
            "Log out",
            appState.user.displayName,
                () async {
              await StateWidget.of(context).signOutOfGoogle();
            },
          ),
        ],
      ),
    );
  }
}