import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/state/picked_date_state.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DatePickerField extends StatefulWidget {
  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final DateFormat dateFormat = DateFormat(Hive.box(SETTINGS_BOX).get(DATE_FORMAT) ?? "dd.MM.yyyy"); // retreives correct dateformat from settings
  TextEditingController textEditingController = TextEditingController(); // used to change value in textField (because we change date with dialog and not typing it)

  @override
  void initState() {
    super.initState();

    final PickedDateState pickedDateState = Provider.of<PickedDateState>(context, listen: false);
    textEditingController.text = dateFormat.format(pickedDateState.dt); // setting dt.now to field if creating new log, and if editing then the correct one
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final PickedDateState pickedDateState = Provider.of<PickedDateState>(context, listen: false);

    final DateTime picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: pickedDateState.dt ?? DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != pickedDateState.dt) {
      setState(() {
        pickedDateState.setDt(picked); // sets picked dt to provider
        textEditingController.text = dateFormat.format(pickedDateState.dt); // setting new dt to textfield
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final PickedDateState pickedDateState = Provider.of<PickedDateState>(context, listen: false);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 28, 28),
      child: TextFormField(
        readOnly: true, // Can't manually edit the text. There was a bug when you opened the dialog, edit cursor was shown on top of dialog (it should have been behind it) so this line removes to edit cursor completely (showCursor is different)
        showCursor: false,
        autocorrect: false,
        controller: textEditingController,
        onTap: () {
          FocusScope.of(context).unfocus(); // Hides keyboard
          _selectDate(context);
        },
        decoration: InputDecoration(
          icon: Icon(MdiIcons.calendar),
          labelText: "Date",
        ),
        validator: (value) {
          if (value.isEmpty || pickedDateState.dt == null) {
            return 'Enter valid date';
          }
          return null;
        },
      ),
    );
  }
}
