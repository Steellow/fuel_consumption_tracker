import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:fuel_consumption_tracker/util/trip_computer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConsumptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(PREFS_BOX).listenable(), // rebuilds widget when something changes inside PREFS_BOX
      builder: (BuildContext context, dynamic value, Widget child) {
        return Text(
          _getConsumptionString(),
          style: Styles.whiteBold,
        );
      },
    );
  }

  String _getConsumptionString() {
    double _consumption = TripComputer.calculateConsumption();

    if (_consumption == double.infinity || _consumption == 0) {
      return "Not enough logs";
    }
    return _consumption.toStringAsFixed(2) + "L/100km";
  }
}
