import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/history/history_screen.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

class ViewHistoryButton extends StatefulWidget {
  @override
  _ViewHistoryButtonState createState() => _ViewHistoryButtonState();
}

class _ViewHistoryButtonState extends State<ViewHistoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: FlatButton(
        shape: Styles.roundShape,
        onPressed: () {
          Get.to(
            ThemeConsumer(child: HistoryScreen()),
          );
        },
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text(
            "View History",
            style: Styles.whiteBold.copyWith(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
