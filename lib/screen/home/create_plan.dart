import 'dart:io';
import 'dart:math';

import 'package:alarm_reminder/local_stroage_repositroy.dart';
import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:alarm_reminder/screen/home/home_screen.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../local_notification.dart';
import '../../widget/botton.dart';
import '../../widget/datepicker.dart';
import '../../widget/input.dart';
import '../../widget/space.dart';

class CreatePlan extends StatefulWidget {
  const CreatePlan({Key? key}) : super(key: key);

  @override
  State<CreatePlan> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {

  late final ReminderData _localStorageRepository;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  List<DateTime> datelist = [];  List<DateTime> datelists = [];
  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
  openBox () async{


    Box box = await _localStorageRepository.OpenBox();

  }
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    datelist = [];
    setState(() {
      if (args.value is PickerDateRange) {
        datelist = getDaysInBetween(
            args.value.startDate, args.value.endDate ?? args.value.startDate);
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        datelist.add(args.value);
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  List<TimeOfDay> time = [];
  Reminder reminder = Reminder();
  TextEditingController medicine = TextEditingController();
  TextEditingController des = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _localStorageRepository = ReminderData();
    notificationPlugin.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan'),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              icon: const Icon(Icons.create_new_folder_outlined),
              tooltip: 'Open shopping cart',
              onPressed: () async {
                if (medicine.text == "" || des.text == "" || time.isEmpty) {
                  Get.snackbar(
                      "Incomplete Information", "Provide all information");
                } else {


                  for (var element in datelist) {
                    for (var time in time) {
                      try {

                        await notificationPlugin.showScheduledNotification(
                          id: Random().nextInt(10000),
                          title: medicine.text,
                          body: des.text,
                          date: DateTime(element.year, element.month,
                              element.day, time.hour, time.minute),
                        );
                        datelists.add(DateTime(element.year, element.month,
                            element.day, time.hour, time.minute));
                      } catch (e) {
                        print(e);
                      }
                    }
                  }
                  reminder = Reminder(
                    title: medicine.text,
                    desc: des.text,
                    date: datelists,
                  );
                  Box box = await _localStorageRepository.OpenBox();
                  _localStorageRepository.addReminder(box, reminder);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen()
                    ),
                  );

                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Space.Y(20),
              Input(
                label: 'Name of Medicine',
                type: InputType.text,
                controller: medicine,
                validator: (v) => v!.isNotEmpty ? null : "  cannot be blank",
              ),
              Space.Y(20),
              Input.multi(
                label: 'Description ',
                type: InputType.text,
                lines: 2,
                controller: des,
                validator: (v) => v!.isNotEmpty ? null : " cannot be blank",
              ),
              Space.Y(20),
              SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(DateTime.now(),
                    DateTime.now().add(const Duration(days: 3))),
              ),
              Space.Y(20),
              Text(
                'Select Time',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
                  Space.Y(10),
              for (var element in time)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        " ${element.hour}:${element.minute} ${element.period.name} ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              time.remove(element);
                            });
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              Press.light(
                'Add time',
                onPressed: () {
                  addTime();
                },
              )
            ]),
          ),
        ));
  }

  void addTime() async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    setState(() {
      time.add(pickedTime!);
    });
    _checkPendingNotificationRequests();
  }

  Future<void> _checkPendingNotificationRequests() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await notificationPlugin.localNotificationsPlugin
            .pendingNotificationRequests();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content:
            Text('${pendingNotificationRequests.length} pending notification '
                'requests'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
