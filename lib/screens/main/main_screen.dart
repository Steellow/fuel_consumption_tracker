import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';

import 'widgets/consumption_text.dart';
import 'widgets/new_log_button.dart';
import 'widgets/settings_button.dart';
import 'widgets/view_history_button.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SettingsButton(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Average Consumption",
                        style: Styles.whiteBold.copyWith(fontSize: 14),
                      ),
                      ConsumptionText(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ViewHistoryButton(),
                      SizedBox(height: 12),
                      NewLogButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
