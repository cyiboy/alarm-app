import 'package:alarm_reminder/screen/auth/login_screen.dart';
import 'package:alarm_reminder/screen/profile/componects/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: 50 ,
          ),
          Text(
            "Setting",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          SizedBox(
            height: 50 ,
          ),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileItem(icon: Icons.star_rate, title: 'Rate App'),
              ProfileItem(icon: Icons.notification_add, title: 'Notifications'),
            ],
          ),
          SizedBox(
            height: 50 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileItem(icon: Icons.call, title: 'Contact Support'),

            ],
          ),
          SizedBox(
            height: Get.height *0.3 ,

          ),
          Center(
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  LoginScreen(),
                    ));
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.redAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
