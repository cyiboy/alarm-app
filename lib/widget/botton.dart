import 'package:flutter/material.dart';


class Press extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color background;
  final Color foreground;
  final bool loading;

  Press.light(this.title, {this.onPressed, this.loading = false})
      : background = Colors.white,
        foreground = const Color(0xFF2F3733);

  Press.bold(this.title,
      {this.onPressed,
        this.loading = false,
        this.foreground = Colors.white,
        this.background =   Colors.indigo});

  Press.dark(this.title, {this.onPressed, this.loading = false})
      : background = const Color(0xFF4B9FDD),
        foreground = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: .15.ofWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: loading
                    ? SizedBox(
                  child: CircularProgressIndicator(),
                  height: 25,
                  width: 25,
                )
                    : Text(
                  title,
                  style: TextStyle(
                    color: foreground, fontWeight: FontWeight.w400,),
                ),
              ),
              onPressed: loading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                  primary: background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}