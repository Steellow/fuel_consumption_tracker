import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/settings/widgets/settings_subtitle.dart';

import 'widgets/rate_app_tile.dart';
import 'widgets/recalculate_tile.dart';
import 'widgets/reset_everything_tile.dart';
import 'widgets/source_code_tile.dart';
import 'widgets/theme_tile.dart';
import 'widgets/total_fuel_tile.dart';
import 'widgets/units_tile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SettingsSubtitle("Stats"),
          TotalFuelTile(), 
          RecalculateTile(), // wip
          Divider(),
          SettingsSubtitle("General settings"),
          ThemeTile(), // wip
          UnitsTile(), // wip
          Divider(), // wip
          SettingsSubtitle("About"),
          RateAppTile(), // wip
          SourceCodeTile(), // wip
          ResetEverythingTile(), // wip
        ],
      ),
    );
  }
}
