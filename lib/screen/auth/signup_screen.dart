import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/botton.dart';
import '../../widget/input.dart';
import '../../widget/space.dart';
import '../dashboard/dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('SignUp'),
     //   backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:
          Form(
            key: _key,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Create your  account',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Space.Y(9),
                    Text(
                      'Let’s set things up. Enter your details.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Space.Y(48),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Input(
                          label: 'First name',
                          type: InputType.text,
                          controller:fname,

                        ),
                        Space.Y(40),
                        Input(
                          label: 'Last name',
                          type: InputType.text,
                          controller: lname,

                        ),
                        Space.Y(40),
                        Input(
                          label: 'Email address',
                          type: InputType.email,
                          controller:  email,

                        ),

                        Space.Y(40),
                        Input(
                          label: 'Password',
                          type: InputType.number,
                          controller: password,

                        ),
                        Space.Y(40),

                        Space.Y(22),
                        Press.bold(
                            "Continue",
                        //    loading: P.auth.loading.value,
                            onPressed: () {
                              // if (_key.currentState!.validate()) {
                              // //  Get.toNamed(Routes.PIN);
                              // }
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  dashboardScreen(),
                                ),
                              );
                            }),
                        Space.Y(24),


                      ],
                    ),
                  ],
                ),
              ),
            ),));
  }
}