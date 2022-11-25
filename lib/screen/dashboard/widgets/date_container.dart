import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 100,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
              offset: const Offset(-3, -3),
              color: Colors.grey.shade400,
              spreadRadius: 4,
              blurRadius: 5),
          const BoxShadow(
              offset: Offset(3, 3),
              color: Colors.white,
              spreadRadius: 3,
              blurRadius: 3)
        ],
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '30',
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'mon',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Colors.lightBlueAccent),
            )
          ],
        ),
      ),
    );
  }
}
