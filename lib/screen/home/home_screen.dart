import 'package:alarm_reminder/screen/home/controller/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/reminder_model.dart';
import '../dashboard/widgets/current_date_template.dart';
import '../dashboard/widgets/custom_appbar.dart';

import 'create_plan.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var ctr = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: CustomAppBar(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrentDateTemplate(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     buildCustomButton(icon: Icons.chevron_left),
                      //     buildCustomButton(icon: Icons.chevron_right)
                      //   ],
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Obx(
                  () => ctr.box.value.isEmpty
                      ? Center(
                          child: SizedBox(
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Create a task'),
                            ],
                          ),
                        ))
                      : ListView(
                          primary: false,
                          shrinkWrap: true,
                          clipBehavior: Clip.none,
                          children: List.generate(
                              ctr.box.value.values.length,
                              (index) => Dismissible(
                                    movementDuration:
                                        const Duration(seconds: 1),
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(70),
                                      ),
                                      padding: const EdgeInsets.only(right: 10),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    key: ValueKey(
                                        ctr.box.value.values.toList()[index]),
                                    onDismissed: (direction) {
                                      ctr.deleteReminder(index);
                                    },
                                    child: ToTakeContainer(
                                      reminder:
                                          ctr.box.value.values.toList()[index],
                                    ),
                                  )),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Past',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     buildCustomButton(icon: Icons.chevron_left),
                      //     buildCustomButton(icon: Icons.chevron_right)
                      //   ],
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreatePlan(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ToTakeContainer extends StatelessWidget {
  const ToTakeContainer({
    Key? key,
    required this.reminder,
  }) : super(key: key);
  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        padding: const EdgeInsets.only(
          top: 10,
          left: 28,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print(reminder.date!.length);
                }
              },
              child: ExpansionTile(
                  leading: const Icon(Icons.medical_services),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reminder.title!,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        reminder.desc!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: reminder.date?.length,
                        itemBuilder: (context, index) {
                          DateTime date = reminder.date?[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${date.month}/${date.day}/${date.year}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: List.generate(
                                    reminder.time!.length,
                                    (index) {
                                      TimeOfDay time = reminder.time?[index];

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.alarm,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${time.hour}:${time.minute} ${time.period.name}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ]),
            )));
  }
}
