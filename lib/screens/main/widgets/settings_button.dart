import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/settings/settings_screen.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

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
        onPressed: () {
          Get.to(
            () => ThemeConsumer(
              child: SettingsScreen(),
            ),
            transition: Transition.cupertino,
          );
        },
      ),
    );
  }
}
