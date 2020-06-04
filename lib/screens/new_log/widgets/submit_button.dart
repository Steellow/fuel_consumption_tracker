import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/screens/history/history_screen.dart';
import 'package:fuel_consumption_tracker/state/picked_date_state.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:fuel_consumption_tracker/util/trip_computer.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController fuelFormController;
  final TextEditingController odometerFormController;
  final int index;

  SubmitButton(this.formkey, this.fuelFormController, this.odometerFormController, this.index);

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
            // backgroundColor: Colors.indigo,
            shape: Styles.roundShape,
            onPressed: () {
              onSubmit(context);
            },
            child: Container(
              child: Text('Submit', style: Styles.whiteBold.copyWith(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(BuildContext context) {
    final PickedDateState pickedDateState = Provider.of<PickedDateState>(context, listen: false);

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
        final Log log = Log(
          pickedDateState.dt, // gets picked dt (default dt.now) from provider
          fuelAmount,
          odometer,
        );
        saveLog(log);

        // if editing log just recalculate prefs all over again to avoid something going wrong
        if (widget.index == null) {
          updatePrefs(odometer, fuelAmount);
          Get.back(); // goes normally back

        } else {
          TripComputer.recalculateEverything(); // ! FIGURE BETTER WAY HERE

          //! next 3 lines pops the new_log, history_view and recreates history_view. (so we history view recreates). Need to find better way
          Get.back(); 
          Get.back(); 
          Get.to(
            ThemeConsumer(child: HistoryScreen()),
          );
        }
      }
    }
  }

  void saveLog(Log log) {
    final logBox = Hive.box(LOGS_BOX);
    if (widget.index == null) {
      logBox.add(log);
    } else {
      logBox.putAt(widget.index, log);
    }
  }

  void updatePrefs(int odometer, double fuelAmount) {
    // Prefs are used to quick-access some important stuff
    // Checks if the new log is smallest or biggest known log, and if so, saves it to prefs
    final prefs = Hive.box(PREFS_BOX);
    if (odometer < (prefs.get(MIN_ODO) ?? 1000000)) {
      prefs.put(MIN_ODO, odometer);
    } else if (odometer > (prefs.get(MAX_ODO) ?? 0)) {
      prefs.put(MAX_ODO, odometer);
    }

    // saves the amount you tanked as lastFuel, and recalculates currentTotalFuel (which does not include lastFuel)
    double currentTotalFuel = prefs.get(TOTAL_FUEL) ?? 0;
    double lastFuel = prefs.get(LAST_FUEL) ?? 0;
    prefs.put(TOTAL_FUEL, currentTotalFuel + lastFuel);
    prefs.put(LAST_FUEL, fuelAmount);

    print('updatePrefs called');
  }
}
