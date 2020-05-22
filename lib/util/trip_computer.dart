import 'package:hive/hive.dart';

class TripComputer {
  static double calculateConsumption() {
    final prefs = Hive.box('prefs');

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
}
