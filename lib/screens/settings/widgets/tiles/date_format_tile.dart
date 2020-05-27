import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DateFormatTile extends StatefulWidget {
  @override
  _DateFormatTileState createState() => _DateFormatTileState();
}

class _DateFormatTileState extends State<DateFormatTile> {
  final Box settings = Hive.box(SETTINGS_BOX);

  final List<String> dateFormatList = [
    'yyyy-MM-dd',
    'yyyy/MM/dd',
    'yyyy.MM.dd',
    'dd-MM-yyyy',
    'dd/MM/yyyy',
    'dd.MM.yyyy',
    'MM-dd-yyyy',
    'MM/dd/yyyy',
    'MM.dd.yyyy',
  ];
  DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CenterIcon(Icon(MdiIcons.calendarHeart)),
      title: Text("Date format"),
      subtitle: ValueListenableBuilder(
        valueListenable: settings.listenable(keys: [DATE_FORMAT]), // Preview text in the tile, listens to changes in that particular settings
        builder: (BuildContext context, dynamic value, Widget child) {
          String dateFormat = settings.get(DATE_FORMAT) ?? "dd.MM.yyyy";
          return Text(DateFormat(dateFormat).format(now));
        },
      ),
      onTap: () {
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(dateFormatList.length, (index) {
                String formattedDate = DateFormat(dateFormatList[index]).format(now);
                return ListTile(
                  title: Text(
                    formattedDate,
                    style: TextStyle(
                      color: _getTextColor(), // Gets right text color for the theme
                    ),
                  ),
                  onTap: () {
                    settings.put(DATE_FORMAT, dateFormatList[index]);
                    Get.back();
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

Color _getTextColor() {
  bool _darkEnabled = Hive.box(SETTINGS_BOX).get(DARK_ENABLED) ?? false;

  if (_darkEnabled) return Colors.white;
  return Colors.black;
}
