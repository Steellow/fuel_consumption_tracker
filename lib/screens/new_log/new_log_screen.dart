import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/new_log/widgets/date_picker_field.dart';
import 'package:fuel_consumption_tracker/state/picked_date_state.dart';
import 'package:provider/provider.dart';

import 'widgets/fuel_amount_field.dart';
import 'widgets/odometer_field.dart';
import 'widgets/submit_button.dart';

class NewLogScreen extends StatefulWidget {
  @override
  _NewLogScreenState createState() => _NewLogScreenState();
}

class _NewLogScreenState extends State<NewLogScreen> {
  // formkey is used to validate forms
  final formKey = GlobalKey<FormState>();
  // Focusnode allows to auto-shift focus to the next form
  final focus = FocusNode();

  // Controllers allow to retrieve text from the field
  final fuelFormController = TextEditingController();
  final odometerFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => PickedDateState(), // creates temporary provider from datetime, so submitButton can easily access the date which can be set in DatePickerField
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
                        DatePickerField(),
                      ],
                    ),
                  ),
                ),
                SubmitButton(formKey, fuelFormController, odometerFormController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fuelFormController.dispose();
    odometerFormController.dispose();
    super.dispose();
  }
}
