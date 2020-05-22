import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:fuel_consumption_tracker/util/trip_computer.dart';

class ConsumptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      TripComputer.calculateConsumption().toStringAsFixed(2) + "L/100km",
      style: Styles.whiteBold,
    );
  }
}
