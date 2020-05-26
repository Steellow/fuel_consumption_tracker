import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ThemeTile extends StatefulWidget {
  @override
  _ThemeTileState createState() => _ThemeTileState();
}

class _ThemeTileState extends State<ThemeTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: false,
      onChanged: (_) {},
      title: Text("Dark mode"),
      subtitle: Text("Dark mode is disabled"),
      secondary: CenterIcon(
        Icon(MdiIcons.brightness6),
      ),
    );
  }
}
