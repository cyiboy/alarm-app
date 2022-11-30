import 'package:alarm_reminder/screen/auth/login_screen.dart';
import 'package:alarm_reminder/screen/profile/componects/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String Name ="";
  @override
  void initState() {
    // TODO: implement initState
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: 50 ,
          ),

          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text:  TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                      text: Name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                      children: <TextSpan>[])
                ]),
          ),


          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50 ,
          ),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileItem(icon: Icons.star_rate, title: 'Rate App'),
              GestureDetector(
                  onTap: (){
                    _launchCaller();
                  },
                  child: ProfileItem(icon: Icons.call, title: 'Contact Support')),
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
  _launchCaller() async {

 
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+2348062627549',
    );
    await launchUrl(launchUri);
  }
}
