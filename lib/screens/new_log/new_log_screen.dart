import 'package:flutter/material.dart';

import 'widgets/fuel_amount_field.dart';
import 'widgets/odometer_field.dart';
import 'widgets/submit_button.dart';

class NewLogScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
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
              SubmitButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}
