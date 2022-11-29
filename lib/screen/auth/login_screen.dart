import 'package:alarm_reminder/screen/auth/forget_password.dart';
import 'package:alarm_reminder/screen/auth/signup_screen.dart';
import 'package:alarm_reminder/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../widget/botton.dart';
import '../../widget/input.dart';
import '../../widget/space.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController Password = TextEditingController();
  bool loading = false;
 @override
  void initState() {
    // TODO: implement initState
   FirebaseAuth.instance
       .authStateChanges()
       .listen((User? user) {
     if (user == null) {
       print('User is currently signed out!');
     } else {
       Navigator.of(context).push(
         MaterialPageRoute(
           builder: (context) =>  dashboardScreen(user: user,),
         ),
       );
     }
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Space.Y(115),


                Text(
                  'Welcome to  Alarm Reminder!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Space.Y(9),
                Text(
                  'Complete your details below',
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
                  //    validator: (v) => v!.isEmail ? null : "Email is poorly formatted",
                    ),
                    Space.Y(40),
                    Input(
                      label: 'Password',
                      type: InputType.password,
                      controller: Password,
                      validator: (v) => v!.isNotEmpty ? null : "Password cannot be blank",
                    ),
                    Space.Y(40),

                    Space.Y(22),
                    Press.bold(
                        "Login",
                        loading: loading,
                        onPressed: () {

                          if (_key.currentState!.validate()) {
                         loginUser();
                          }
                        }),
                    Space.Y(24),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: (){
                          //     Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) =>  ResetPassword(),
                          //       ),
                          //     );
                          //   },
                          //   child:  Text(
                          //     'Rest Password',
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // )

                        ]
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    bottomSheet: Container(
      height: 100,
      color: Colors.white,
      child:   Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Dont have an account?',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  SignUpScreen(),
                  ),
                );
              },
              child:  Text(
                'Signup',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )

          ]
      ) ,
    ),);



  }
    loginUser() async {
      setState(() {
        loading = true;
      });
      try {

        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text,
            password: Password.text
        );
        setState(() {
          loading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  dashboardScreen(user: credential.user,),
          ),
        );
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
            "Error", e.code);
        setState(() {
          loading = false;
        });
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }else{
          print(e);
        }
      }
    }
}