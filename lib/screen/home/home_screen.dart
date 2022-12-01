import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:alarm_reminder/widget/space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../local_stroage_repositroy.dart';
import '../dashboard/widgets/current_date_template.dart';
import '../dashboard/widgets/custom_appbar.dart';
import '../dashboard/widgets/custom_round_button.dart';
import '../dashboard/widgets/date_container.dart';
import 'create_plan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Reminder> reminders = [];
  bool loading = false;
  bool areSameDay(DateTime one, DateTime two) {
    return one.day == two.day && one.month == two.month && one.year == two.year;
  }
  int daysBetween(DateTime from, DateTime to) {
    if(from.difference(to).inHours == 0 ){
      return from.difference(to).inMinutes;
    }
    return from.difference(to).inHours ;
  }
  String timeBetween(DateTime from, DateTime to) {
    if(from.difference(to).inHours == 0 ){
      return " ${from.difference(to).inMinutes} Min";
    }

    return " ${from.difference(to).inHours} Hours";
  }
  openBox () async{
    reminders = [];
   setState(() {
     loading = true;
   });
    Box box = await _localStorageRepository.OpenBox();
    setState(() {
      loading = false;
    });
    reminders = _localStorageRepository.getAll(box);

  }
  late final ReminderData _localStorageRepository;
  GlobalKey key = GlobalKey();
  String Name = "";
  @override
  void initState() {
    // TODO: implement initState
    _localStorageRepository = ReminderData();
    openBox();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {

        setState(() {
          Name = user.displayName??'';
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: const EdgeInsets.all(  20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
               SizedBox(
                  width: Get.width,
                ),
                const CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text:  TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: Name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                            children: <TextSpan>[])
                      ]),
                ),


                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Your Medicines for today',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),

               // const CurrentDateTemplate(),
                Space.Y(25),
                Row(
                  children: [

                    Text(
                      'upcomming',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ],
                ),
                Space.Y(15),
                for(var element in reminders)
                  for(var elements in element.date!)
                  if(areSameDay( DateTime.now(),elements))
                    if(!daysBetween(elements, DateTime.now()).isNegative)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: Get.width,

                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.indigo
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${elements.hour}:${elements.minute}".padLeft(2, '0'),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Space.Y(15),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Next medicine in ${timeBetween(elements, DateTime.now())}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Space.Y(15),
                                  Text(
                                    "Drug: " + element.title!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Space.Y(5),
                                  Text(
                                    "Desc: " +  element.desc!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Space.X(15),
                            Icon(Icons.medical_information_sharp, size: Get.width *0.2, color: Colors.white,)
                          ],
                        )

                      ],
                    ) ,
                  ),
                ),
                Row(
                  children: [

                    Text(
                      'Past',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ],
                ),
                Space.Y(15),
                for(var element in reminders)
                  for(var elements in element.date!)
                    if(areSameDay( DateTime.now(),elements))
                      if(daysBetween(elements, DateTime.now()).isNegative)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: Get.width,

                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.indigo
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${elements.hour}:${elements.minute}".padLeft(2, '0'),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Space.Y(15),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Medicine was to be taken at '+  "${elements.hour}:${elements.minute}".padLeft(2, '0'),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          Space.Y(15),
                                          Text(
                                           "Drug: " + element.title!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                          Space.Y(5),
                                          Text(
                                            "Desc: " +   element.desc!,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Space.X(15),
                                    Icon(Icons.medical_information_sharp, size: Get.width *0.2, color: Colors.white,)
                                  ],
                                )

                              ],
                            ) ,
                          ),
                        ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const CreatePlan(),
            ),
          );
        },
        backgroundColor: Colors.indigo,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,


      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 28, bottom: 10, ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),

      ),
      child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child:ExpansionTile(

        leading: Icon(Icons.medical_services),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Description',
              style: TextStyle(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '11/22/22',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '11/22/22',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '11/22/22',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.alarm, size: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '10:00 Am',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 15,
          ),

        ]
      )


    ));
  }
}
