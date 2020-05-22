import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryListView extends StatefulWidget {
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  Widget _buildItem(DateTime dt, int distance, String formattedDate) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text("18.37L"),
          subtitle: Text(distance.toString() + "km"),
          trailing: Text(formattedDate),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          int distance = (100123 + index);
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('dd.MM.yyyy').format(now);

          return _buildItem(now, distance, formattedDate);
        },
      ),
    );
  }
}
