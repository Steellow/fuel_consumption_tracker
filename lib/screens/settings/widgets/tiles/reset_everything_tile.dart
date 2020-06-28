import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:fuel_consumption_tracker/util/theme_tools.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResetEverythingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.dialog(
          AlertDialog(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            title: Text(
              "Are you sure you want to reset everything?",
              style: TextStyle(
                color: ThemeTools.getTextColor(),
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Get.back();
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Hive.box(LOGS_BOX).clear();
                  Hive.box(PREFS_BOX).clear();
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
      leading: CenterIcon(Icon(MdiIcons.deleteForever)),
      title: Text("Reset everything"),
    );
  }
}
