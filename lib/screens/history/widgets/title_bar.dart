import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:get/get.dart';

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      color: Colors.indigo,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                onPressed: () {
                  Get.back();
                },
              ),
              Text(
                'History',
                style: Styles.whiteBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
