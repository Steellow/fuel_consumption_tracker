import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';

class SettingsSubtitle extends StatelessWidget {
  final String text;

  SettingsSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 0, 12),
      child: Text(
        text.toUpperCase(),
        style: Styles.settingsSubtitle,
      ),
    );
  }
}
