import 'package:flutter/material.dart';

import 'widgets/fuel_amount_field.dart';
import 'widgets/odometer_field.dart';
import 'widgets/submit_button.dart';

class NewLogScreen extends StatelessWidget {
  // formkey is used to validate forms
  final formKey = GlobalKey<FormState>();
  // Focusnode allows to auto-shift focus to the next form
  final focus = FocusNode();

  // Controllers allow to retrieve text from the field
  final fuelFormController = TextEditingController();
  final odometerFormController = TextEditingController();
  // ! DISPOSE!

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
                      FuelAmountField(focus, fuelFormController),
                      OdometerField(focus, odometerFormController),
                    ],
                  ),
                ),
              ),
              SubmitButton(formKey, fuelFormController, odometerFormController),
            ],
          ),
        ),
      ),
    );
  }
}
