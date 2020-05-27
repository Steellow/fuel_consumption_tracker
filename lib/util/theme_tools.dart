import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'hive_keys.dart';

class ThemeTools {
  Color getTextColor() {
    bool _darkEnabled = Hive.box(SETTINGS_BOX).get(DARK_ENABLED) ?? false;

    if (_darkEnabled) return Colors.white;
    return Colors.black;
  }
}
