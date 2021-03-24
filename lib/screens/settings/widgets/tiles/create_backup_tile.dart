import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class CreateBackgupTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _createBackupFileAndShare,
      leading: CenterIcon(Icon(MdiIcons.cloudUpload)),
      title: Text("Create backup"),
    );
  }

  Future<Null> _createBackupFileAndShare() async {
    final Box logBox = Hive.box(LOGS_BOX);
    DateTime now = new DateTime.now();

    if (logBox.length == 0) {
      Get.snackbar(
        "Can't export",
        "No records to export",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Create json objects from logs and put them into array
      var logArray = [];
      for (var i = 0; i < logBox.length; i++) {
        final log = logBox.getAt(i) as Log;
        final logAsJson = {
          "date": log.date.toString(),
          "amount": log.amount,
          "odometer": log.odometer,
        };
        logArray.add(logAsJson);
      }
      Map<String, dynamic> backupJson = {
        'date': now.toString(),
        'data': logArray,
      };

      // Create backup file
      final dir = (await getTemporaryDirectory()).path;
      File tempFile = new File('$dir/fct-backup_${now.toString()}.json'); // add cur_date to filename
      await tempFile.writeAsString(json.encode(backupJson)).then((savedFile) => {
            Share.shareFiles(['$dir/fct-backup_${now.toString()}.json'])
          });

      //* Test decode
      // Map<String, dynamic> decodedJson = await json.decode(await File('$dir/temp.json').readAsString());
      // print(decodedJson['fct-backup'].length);

      //* Can't delete backup file because sharing the file is async. However it takes so little space that it doesn't matter (and it saves it to temporary directory (=cache))
      // tempFile.delete();
    }
  }
}
