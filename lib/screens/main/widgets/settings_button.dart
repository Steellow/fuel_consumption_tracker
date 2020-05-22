import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        tooltip: "Settings",
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
