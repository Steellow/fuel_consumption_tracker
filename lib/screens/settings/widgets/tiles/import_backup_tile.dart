import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImportBackupTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _importBackup,
      leading: CenterIcon(Icon(MdiIcons.databaseImport)),
      title: Text("Import backup"),
    );
  }

  Future<Null> _importBackup() async {
    final Box logBox = Hive.box(LOGS_BOX);

    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path);
      print(file);
    }
  }
}
