import 'dart:io';
import 'dart:isolate';

import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:alarm_reminder/screen/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_notification.dart';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());

  await Hive.openBox('reminders');
  runApp(const MyApp());
  final int helloAlarmID = 0;
  await AndroidAlarmManager.oneShotAt(
      DateTime(2022, 12, 25, 12, 55, 0), helloAlarmID, printHello);
}

getApplicationDocumentsDirectory() {
  AndroidAlarmManager.oneShotAt(DateTime.now(), 2, () {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Splash(),
    );
  }
}
