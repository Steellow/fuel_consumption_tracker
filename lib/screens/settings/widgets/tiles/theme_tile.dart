import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeTile extends StatefulWidget {
  @override
  _ThemeTileState createState() => _ThemeTileState();
}

class _ThemeTileState extends State<ThemeTile> {
  bool _currentVal;
  final Box settings = Hive.box(SETTINGS_BOX);

  @override
  void initState() { 
    super.initState();
    _currentVal = settings.get(DARK_ENABLED) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _currentVal,
      onChanged: (value) {
        setState(() {
          _currentVal = value; // updates the tile
        });
        settings.put(DARK_ENABLED, value); // saves setting to hive (used in this tiles initstate)
        ThemeProvider.controllerOf(context).nextTheme(); // changes theme
      },
      title: Text("Dark mode"),
      subtitle: Text("Dark mode is disabled"),
      secondary: CenterIcon(
        Icon(MdiIcons.brightness6),
      ),
    );
  }
}
