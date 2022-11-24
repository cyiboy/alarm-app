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
                          'To Take',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ),
                      Row(
                        children: [
                          buildCustomButton(icon: Icons.chevron_left),
                          buildCustomButton(icon: Icons.chevron_right)
                        ],
                      )
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
                )
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
        backgroundColor: Colors.black,
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
      height: 90,
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
              offset: const Offset(-3, -3),
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 5),
          const BoxShadow(
              offset: Offset(3, 3),
              color: Colors.white,
              spreadRadius: 3,
              blurRadius: 3)
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 27,
            child: Icon(Icons.medical_services),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
              const Text(
                'Drug name',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue),
              ),
              Row(
                children: const [
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '30:00 pm',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
