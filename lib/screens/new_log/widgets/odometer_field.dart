import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OdometerField extends StatefulWidget {
  final FocusNode focus;
  final TextEditingController textEditingController;

  OdometerField(this.focus, this.textEditingController);

  @override
  _OdometerFieldState createState() => _OdometerFieldState();
}

class _OdometerFieldState extends State<OdometerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 28, 16),
      child: TextFormField(
        controller: widget.textEditingController,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
        keyboardType: TextInputType.number,
        focusNode: widget.focus,
        decoration: InputDecoration(
          icon: Icon(MdiIcons.counter),
          labelText: "Odometer",
          suffixText: "km",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter valid odometer';
          }
          return null;
        },
      ),
    );
  }
}
