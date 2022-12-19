import 'dart:io';

import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:alarm_reminder/screen/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_notification.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());

  await Hive.openBox('reminders');
  runApp(const MyApp());
}

getApplicationDocumentsDirectory() {}

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
