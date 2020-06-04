import 'package:flutter/material.dart';

class PickedDateState extends ChangeNotifier {
  DateTime _dt;

  PickedDateState(DateTime dateTime) {
    _dt = dateTime;
  }

  DateTime get dt => _dt;
  
  void setDt(DateTime dt) {
    _dt = dt;
  }
}