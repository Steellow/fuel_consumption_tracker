import 'package:flutter/material.dart';
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
        onFieldSubmitted: (v) {
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
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
