import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:hive/hive.dart';

abstract class TripComputer {
  static double calculateConsumption() {
    final Box prefs = Hive.box(PREFS_BOX);

    if (prefs.get(IMPERIAL_ENABLED) ?? false) {
      return _calculateImperialConsumption();
    } else {
      return _calculateMetricConsumption();
    }
  }

  static double _calculateMetricConsumption() {
    final prefs = Hive.box(PREFS_BOX);

    int minOdo = prefs.get('minOdo') ?? 0;
    int maxOdo = prefs.get('maxOdo') ?? 0;
    int totalOdo = maxOdo - minOdo;

    double totalFuel = prefs.get('totalFuel') ?? 0.0;

    double averageConsumption = totalFuel / (totalOdo / 100);

    if (averageConsumption.isNaN || averageConsumption == double.infinity) {
      return 0;
    } else {
      return averageConsumption;
    }
  }

  static double _calculateImperialConsumption() {
    final prefs = Hive.box(PREFS_BOX);

    int minOdo = prefs.get('minOdo') ?? 0;
    int maxOdo = prefs.get('maxOdo') ?? 0;
    int totalOdo = maxOdo - minOdo;

    double totalFuel = prefs.get('totalFuel') ?? 0.0;

    double averageConsumption = totalOdo / totalFuel;

    if (averageConsumption.isNaN || averageConsumption == double.infinity) {
      return 0;
    } else {
      return averageConsumption;
    }
  }

  static void recalculateEverything() {
    final prefs = Hive.box(PREFS_BOX);
    final logsBox = Hive.box(LOGS_BOX);

    var logsList = logsBox.values;

    double totalFuel = 0; // totalFuel does NOT include lastFuel
    double lastFuel = 0;

    int minOdo = 0;
    int maxOdo = 0;

    // Goes through every log, calculates total consumption and finds log with smallest and biggest odometer
    logsList.forEach((log) {
      // adds each logs consumption to totalconsumption
      totalFuel = totalFuel + log.amount;

      // checks every logs odometer if its smaller than the smallest or bigger than the biggest
      if (log.odometer < minOdo || minOdo == 0) {
        minOdo = log.odometer;
      } else if (log.odometer > maxOdo) {
        maxOdo = log.odometer;
        lastFuel = log.amount;
      }
    });

    totalFuel = totalFuel - lastFuel;

    prefs.put(MIN_ODO, minOdo);
    prefs.put(MAX_ODO, maxOdo);
    prefs.put(TOTAL_FUEL, totalFuel);
    prefs.put(LAST_FUEL, lastFuel);

    print("minOdo: " + minOdo.toString());
    print("maxOdo: " + maxOdo.toString());
    print("totalConsumption: " + totalFuel.toString());

    Fluttertoast.showToast(msg: "Success"); // Using 3rd party library because otherwise you would need context
  }

  static String getFuelUnit() {
    final Box prefs = Hive.box(PREFS_BOX);

    if (prefs.get(IMPERIAL_ENABLED) ?? false) {
      return " gals";
    }
    return " L";
  }

  static String getLengthUnit() {
    final Box prefs = Hive.box(PREFS_BOX);

    if (prefs.get(IMPERIAL_ENABLED) ?? false) {
      return " miles";
    }
    return " km";
  }
}
