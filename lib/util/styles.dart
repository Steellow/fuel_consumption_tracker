import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle whiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const TextStyle settingsSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static ShapeBorder roundShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(300.0),
  );
}
