import 'package:hive/hive.dart';

// allows hive to create adapter (flutter packages pub run build_runner build)
part 'log.g.dart';

@HiveType(typeId: 0) // HiveType requires some ID, 0 seems like a good option
class Log {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  double amount; // meaning how much you fueled up
  @HiveField(2)
  int odometer;

  Log(this.date, this.amount, this.odometer);
}
