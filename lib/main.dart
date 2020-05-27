import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/main/main_screen.dart';
import 'package:fuel_consumption_tracker/util/hive_keys.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:theme_provider/theme_provider.dart';

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
    return ThemeProvider(
      themes: [
        AppTheme.light().copyWith(
          id: 'customlight',
          data: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.indigo,
          ),
        ),
        AppTheme.dark().copyWith(
          id: 'customdark',
          data: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigoAccent,
            accentColor: Colors.indigoAccent,
          ),
        ),
      ],
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fuel Consumption Tracker',
        home: FutureBuilder(
          future: Future.wait([
            Hive.openBox(LOGS_BOX),
            Hive.openBox(PREFS_BOX),
            Hive.openBox(SETTINGS_BOX),
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
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
