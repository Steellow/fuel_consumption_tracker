import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HistoryListView extends StatefulWidget {
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  final Box logBox = Hive.box(LOGS_BOX);
  final Box settings = Hive.box(SETTINGS_BOX);

  String _dateFormat;

  @override
  void initState() {
    super.initState();
    _dateFormat = settings.get(DATE_FORMAT) ?? "dd.MM.yyyy";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      child: ListView.builder(
        // Wrap with WatchBoxBuilder if needed
        itemCount: logBox.length,
        itemBuilder: (context, index) {
          int reverseIndex = logBox.length - 1 - index;
          final log = logBox.getAt(reverseIndex) as Log;
          return _buildItem(log);
        },
      ),
    );
  }

  Widget _buildItem(Log log) {
    String formattedDate = DateFormat(_dateFormat).format(log.date);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(log.amount.toString() + "L"),
          subtitle: Text(log.odometer.toString() + "km"),
          trailing: Text(formattedDate),
        ),
      ),
    );
  }
}
