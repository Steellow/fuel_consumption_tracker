import 'package:flutter/material.dart';

class PickedDateState extends ChangeNotifier {
  DateTime _dt = DateTime.now();

  DateTime get dt => _dt;
  
  void setDt(DateTime dt) {
    _dt = dt;
  }
}