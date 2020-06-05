import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';

class EditTipText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Opacity(
          opacity: 0.4,
          child: Text(
            "YOU CAN EDIT LOGS BY LONG-PRESSING THEM",
            textAlign: TextAlign.center,
            style: Styles.settingsSubtitle,
          ),
        ),
      ),
    );
  }
}
