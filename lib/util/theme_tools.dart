import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'hive_keys.dart';

abstract class ThemeTools {
  static Color getTextColor() {
    bool _darkEnabled = Hive.box(SETTINGS_BOX).get(DARK_ENABLED) ?? false;

    if (_darkEnabled) return Colors.white;
    return Colors.black;
  }
}
