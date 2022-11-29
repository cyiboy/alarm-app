import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String name;
    CustomAppBar({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: SizedBox(
            width: 150,
            child: Row(
              children: [
                RichText(
                  text:  TextSpan(
                      text: 'Hi, ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 15),
                            children: <TextSpan>[])
                      ]),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.waving_hand,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_sharp))
      ],
    );
  }
}
