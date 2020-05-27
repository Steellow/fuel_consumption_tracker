import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResetEverythingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Hive.box(LOGS_BOX).clear();
        Hive.box(PREFS_BOX).clear();
        Get.restartApp();
        print("ASDF");
      },
      leading: CenterIcon(Icon(MdiIcons.deleteForever)),
      title: Text("Reset everything"),
    );
  }
}
