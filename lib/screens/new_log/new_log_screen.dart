import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/new_log/widgets/odometer_field.dart';

import 'widgets/fuel_amount_field.dart';

class NewLogScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Card(
              elevation: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FuelAmountField(focus),
                  OdometerField(focus),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
