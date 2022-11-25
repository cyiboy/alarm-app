import 'package:flutter/material.dart';

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
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      const Expanded(
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
                ListView(
                  primary: false,
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  children: const [
                    ToTakeContainer(),
                    ToTakeContainer(),
                    ToTakeContainer(),
                    ToTakeContainer(),
                    ToTakeContainer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      const Expanded(
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
