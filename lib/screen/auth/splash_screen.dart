import 'package:alarm_reminder/screen/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  /// Move from loader to splash after 5 seconds
  Future<void> delayedMove({int milli = 2000, String? to}) async {
    await Future.delayed(Duration(milliseconds: milli));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  LoginScreen(),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    delayedMove();
    super.initState();
  }
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   // if (AuthService.isLoggedIn()) {
  //   //   delayedMove(to: Dashboard.uri);
  //   // } else delayedMove();
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
}
