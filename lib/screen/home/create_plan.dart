import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
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
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';


  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {

    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  List<TimeOfDay> time = [];
  TextEditingController medicine = TextEditingController();
  TextEditingController des = TextEditingController();

  // void _scheduleOneShotAlarm(chosenDate, oneShotAtTaskId,oneShotAtTaskCallback) async {
  //
  //
  //     await AndroidAlarmManager.oneShotAt(
  //         chosenDate,
  //         oneShotAtTaskId,
  //         oneShotAtTaskCallback,
  //       alarmClock: true,
  //       allowWhileIdle: true,
  //       wakeup: true,
  //       rescheduleOnReboot: true
  //
  //     );
  //
  // }


@override
  void initState() {
    // TODO: implement initState
  initNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan'),
          actions: [
            IconButton(
              icon: const Icon(Icons.create_new_folder_outlined),
              tooltip: 'Open shopping cart',
              onPressed: () {
              if(medicine.text =="" || des.text =="" || time.isEmpty )
                {
                  Get.snackbar("Incomplete Information", "Provide all information");

                }



              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
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
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),

              ),
              Space.Y(20),
              Text(
                'Select Time',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              for (var element in time)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(" ${element.hour}:${element.minute} ${element.period.name} ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(onPressed: () {
                        setState(() {
                          time.remove(element);
                        });
                      }, icon: Icon(Icons.delete))
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
      time.add(
        pickedTime!
      );
    });
  }

  void createAlarm(){

  }


}
