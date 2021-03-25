import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/new_log/new_log_screen.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

class NewLogButton extends StatefulWidget {
  @override
  _NewLogButtonState createState() => _NewLogButtonState();
}

class _NewLogButtonState extends State<NewLogButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: Styles.roundShape,
        onPressed: () {
          Get.to(
            () => ThemeConsumer(
              child: NewLogScreen(),
            ),
          );
        },
        child: Text('New Log', style: Styles.whiteBold.copyWith(color: Colors.indigo)),
      ),
    );
  }
}
