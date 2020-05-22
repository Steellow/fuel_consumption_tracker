import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FuelAmountField extends StatefulWidget {
  final FocusNode focus;

  FuelAmountField(this.focus);

  @override
  _FuelAmountFieldState createState() => _FuelAmountFieldState();
}

class _FuelAmountFieldState extends State<FuelAmountField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 28, 16),
      child: TextFormField(
        inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[\\-|\\ ]'))], // Blocks everything expect numbers, dots and commas
        keyboardType: TextInputType.number,
        onFieldSubmitted: (v) {
          // This makes the focus shift to the next text field when clicking ok from keyboard
          FocusScope.of(context).requestFocus(widget.focus);
        },
        autofocus: true,
        decoration: InputDecoration(
          icon: Icon(MdiIcons.gasStation),
          labelText: "Spent liters",
          suffixText: "L",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter valid amount';
          }
          return null;
        },
      ),
    );
  }
}
