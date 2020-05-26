import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController fuelFormController;
  final TextEditingController odometerFormController;

  SubmitButton(this.formkey, this.fuelFormController, this.odometerFormController);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: FloatingActionButton(
            backgroundColor: Colors.indigo,
            shape: Styles.roundShape,
            onPressed: () {
              if (widget.formkey.currentState.validate()) {
                double fuelAmount = double.tryParse(widget.fuelFormController.text);
                int odometer = int.tryParse(widget.odometerFormController.text);

                // check that everything OK
                if (fuelAmount == null) {
                  // That snackbar is ugly, but doesn't matter since this shouldn't be triggered in the first place
                  Get.snackbar(
                    "Error",
                    "Invalid fuel amount",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else if (odometer == null) {
                  Get.snackbar(
                    "Error",
                    "Invalid odometer",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  // If values are OK save log object and update prefs
                  final Log log = Log(DateTime.now(), fuelAmount, odometer);
                  saveLog(log);

                  updatePrefs(odometer, fuelAmount);

                  Get.back();
                }
              }
            },
            child: Container(
              // margin: EdgeInsets.all(12),
              child: Text('Submit', style: Styles.whiteBold.copyWith(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }

  void saveLog(Log log) {
    final logBox = Hive.box('logs');
    logBox.add(log);
    print("saveLog succee?");
  }

  void updatePrefs(int odometer, double fuelAmount) {
    // Prefs are used to quick-access some important stuff
    final prefs = Hive.box('prefs');
    if (odometer < (prefs.get('minOdo') ?? 1000000)) {
      prefs.put('minOdo', odometer);
    } else if (odometer > (prefs.get('maxOdo') ?? 0)) {
      prefs.put('maxOdo', odometer);
    }

    double currentTotalFuel = prefs.get('totalFuel') ?? 0;
    double lastFuel = prefs.get('lastFuel') ?? 0;
    prefs.put('totalFuel', currentTotalFuel + lastFuel);
    prefs.put('lastFuel', fuelAmount);

    print('updatePrefs called');
  }
}
