import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UnitsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CenterIcon(Icon(MdiIcons.ruler)),
      title: Text("Unit"),
      subtitle: Text("Currently using kilometers/liters"),
    );
  }
}