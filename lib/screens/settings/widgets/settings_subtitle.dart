import 'package:flutter/material.dart';

class SettingsSubtitle extends StatelessWidget {
  final String text;

  SettingsSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 0, 0),
      child: Text(text),
    );
  }
}
