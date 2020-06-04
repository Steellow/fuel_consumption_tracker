import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/screens/new_log/widgets/date_picker_field.dart';
import 'package:fuel_consumption_tracker/state/picked_date_state.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'widgets/fuel_amount_field.dart';
import 'widgets/odometer_field.dart';
import 'widgets/submit_button.dart';

class NewLogScreen extends StatefulWidget {
  final int index; // if index is null we are creating new log, if index is not null we are editing existing log

  const NewLogScreen({
    Key key,
    this.index,
  }) : super(key: key);

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

  // we create PickedDateState with this value. If editing log instead of creating new, we can edit this
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // prefill fields if we editing existing log
    if (widget.index != null) {
      _prefillFields();
    }
  }

  void _prefillFields() {
    final logBox = Hive.box(LOGS_BOX);
    Log log = logBox.getAt(widget.index);

    fuelFormController.text = log.amount.toString();
    odometerFormController.text = log.odometer.toString();
    _dateTime = log.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => PickedDateState(_dateTime), // creates temporary provider from datetime, so submitButton can easily access the date which can be set in DatePickerField
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
                SubmitButton(
                  formKey,
                  fuelFormController,
                  odometerFormController,
                  widget.index, // passing the index here so submit button knows whether to create new log or edit existing one
                ),
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
