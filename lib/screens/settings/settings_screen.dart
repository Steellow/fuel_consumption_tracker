import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 0, 0),
            child: Text("About"),
          ),
          ListTile(
            title: Text("Total fuel"),
            subtitle: Text("24.06L"),
          ),
        ],
      ),
    );
  }
}
