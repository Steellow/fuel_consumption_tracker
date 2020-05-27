import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/settings/widgets/settings_subtitle.dart';

import 'widgets/tiles/date_format_tile.dart';
import 'widgets/tiles/rate_app_tile.dart';
import 'widgets/tiles/recalculate_tile.dart';
import 'widgets/tiles/reset_everything_tile.dart';
import 'widgets/tiles/source_code_tile.dart';
import 'widgets/tiles/theme_tile.dart';
import 'widgets/tiles/total_fuel_tile.dart';
import 'widgets/tiles/units_tile.dart';



class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SettingsSubtitle("Stats"),
          TotalFuelTile(), 
          RecalculateTile(),
          Divider(),
          SettingsSubtitle("General settings"),
          ThemeTile(), // wip
          UnitsTile(), // wip
          DateFormatTile(), // needs functionality
          Divider(), // wip
          SettingsSubtitle("About"),
          // RateAppTile(), // Add when app is on gPlay
          SourceCodeTile(),
          ResetEverythingTile(),
        ],
      ),
    );
  }
}
