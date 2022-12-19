import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  Rx<Box> box = Hive.box('reminders').obs;

  RxList<Reminder> plans = <Reminder>[].obs;

  void addToBox(Reminder reminder) {
    box.value.add(reminder);
    box.update((val) {});
    debugPrint(box.value.length.toString());
    Get.snackbar('Successful', 'Plan has been created',
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  void deleteReminder(int index) {
    box.value.deleteAt(index);
    box.update((val) {});
  }

  void fetchReminders() {}
}
