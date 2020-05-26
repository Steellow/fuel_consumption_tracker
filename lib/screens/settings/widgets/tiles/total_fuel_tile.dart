import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TotalFuelTile extends StatefulWidget {
  @override
  _TotalFuelTileState createState() => _TotalFuelTileState();
}

class _TotalFuelTileState extends State<TotalFuelTile> {
  final prefsBox = Hive.box(PREFS_BOX);

  double _getTotalFuel() {
    if (prefsBox.get(TOTAL_FUEL) != null) {
      return prefsBox.get(TOTAL_FUEL);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {}, // Empty listtile for InkWell effect
      leading: CenterIcon(
        Icon(MdiIcons.fuel),
      ),
      title: Text("Total fuel"),
      subtitle: Text(_getTotalFuel().toStringAsFixed(2) + "L"),
    );
  }
}
