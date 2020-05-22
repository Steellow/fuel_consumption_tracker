import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle whiteBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static ShapeBorder roundShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(300.0),
  );
}
