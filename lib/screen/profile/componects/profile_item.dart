import 'package:alarm_reminder/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileItem({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
            color: Colors.indigo
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.white,),
          Space.Y(20),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
