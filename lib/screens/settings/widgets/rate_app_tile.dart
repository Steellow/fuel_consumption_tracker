import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';

class RateAppTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CenterIcon(Icon(Icons.star)),
      title: Text("Rate app"),
      
    );
  }
}