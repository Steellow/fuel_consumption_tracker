import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TotalFuelTile extends StatelessWidget {
  final prefsBox = Hive.box(PREFS_BOX);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CenterIcon(
        Icon(MdiIcons.fuel),
      ),
      title: Text("Total fuel"),
      subtitle: Text(prefsBox.get(TOTAL_FUEL).toStringAsFixed(2) + "L"),
    );
  }
}
