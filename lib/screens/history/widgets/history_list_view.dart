import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HistoryListView extends StatefulWidget {
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  Box logBox;

  @override
  void initState() {
    super.initState();
    logBox = Hive.box('logs');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      child: Align(
        // ListView needs to be in Align because list is reversed (otherwise it would be at bottom of screen)
        alignment: Alignment.topCenter,
        child: ListView.builder(
          // Wrap with WatchBoxBuilder if needed
          shrinkWrap: true,
          reverse: true,
          itemCount: logBox.length,
          itemBuilder: (context, index) {
            final log = logBox.getAt(index) as Log;
            return _buildItem(log);
          },
        ),
      ),
    );
  }

  Widget _buildItem(Log log) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(log.date);

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
