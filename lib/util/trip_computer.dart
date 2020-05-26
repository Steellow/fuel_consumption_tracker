import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';

class TripComputer {
  static double calculateConsumption() {
    final prefs = Hive.box(PREFS_BOX);

    int minOdo = prefs.get('minOdo') ?? 0;
    int maxOdo = prefs.get('maxOdo') ?? 0;

    int totalOdo = maxOdo - minOdo;
    double totalFuel = prefs.get('totalFuel') ?? 0.0;

    double averageConsumption = totalFuel / (totalOdo / 100);

    if (averageConsumption.isNaN) {
      return 0;
    } else {
      return averageConsumption;
    }
  }

  static void recalculateEverything() {
    final prefs = Hive.box(PREFS_BOX);
    final logsBox = Hive.box(LOGS_BOX);

    var logsList = logsBox.values;

    double totalConsumption = 0;
    int minOdo = 0;
    int maxOdo = 0;

    // Goes through every log, calculates total consumption and finds log with smallest and biggest odometer
    logsList.forEach((log) {
      // adds each logs consumption to totalconsumption
      totalConsumption = totalConsumption + log.amount;

      // checks every logs odometer if its smaller than the smallest or bigger than the biggest
      if (log.odometer < minOdo || minOdo == 0) {
        minOdo = log.odometer;
      } else if (log.odometer > maxOdo) {
        maxOdo = log.odometer;
      }
    });

    prefs.put(MIN_ODO, minOdo);
    prefs.put(MAX_ODO, maxOdo);
    prefs.put(TOTAL_FUEL, totalConsumption);

    print("minOdo: " + minOdo.toString());
    print("maxOdo: " + maxOdo.toString());
    print("totalConsumption: " + totalConsumption.toString());

    Fluttertoast.showToast(msg: "Success");
  }
}
