import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // needs to be called before getting appDocDir

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(LogAdapter());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // Stateful so we can dispose hive in the end
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuel Consumption Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Future.wait([
          Hive.openBox('logs'),
          Hive.openBox('prefs'),
        ]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return MainScreen();
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
