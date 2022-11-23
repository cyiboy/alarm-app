import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/botton.dart';
import '../../widget/input.dart';
import '../../widget/space.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Rest Password'),
      //  backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Space.Y(9),
                Text(
                  'Input Your Email',
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
                      label: 'Email address',
                      type: InputType.email,
                      controller: email,
                    ),
                    Space.Y(40),
                    Press.bold("Reset Password",
                        //loading: P.auth.loading.value,
                        onPressed: () {
                        //  P.auth.loginController();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));

  }
}