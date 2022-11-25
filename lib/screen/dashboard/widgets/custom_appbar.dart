import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
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
                  text: const TextSpan(
                      text: 'Hi,',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Kay',
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
