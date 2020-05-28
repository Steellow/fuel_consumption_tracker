import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UnitsTile extends StatefulWidget {
  @override
  _UnitsTileState createState() => _UnitsTileState();
}

class _UnitsTileState extends State<UnitsTile> {
  bool _currentVal;
  final Box prefs = Hive.box(PREFS_BOX);

  @override
  void initState() {
    super.initState();
    _currentVal = prefs.get(IMPERIAL_ENABLED) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _currentVal,
      onChanged: (value) {
        setState(() {
          _currentVal = value; // updates the tile
          prefs.put(IMPERIAL_ENABLED, value);
        });
      },
      secondary: CenterIcon(Icon(MdiIcons.ruler)),
      title: Text("Use imperial units"),
      subtitle: Text(_getSubtitle()),
      activeColor: Colors.indigoAccent,
    );
  }

  String _getSubtitle() {
    if (_currentVal) {
      return "Currently using imperial units";
    }
    return "Currently using metric units";
  }
}
