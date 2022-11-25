import 'package:flutter/material.dart';

class CurrentDateTemplate extends StatelessWidget {
  const CurrentDateTemplate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: const TextSpan(
              text: 'August',
              style: TextStyle(
                  color: Colors.black,
                  wordSpacing: 1,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900,
                  fontSize: 17),
              children: <TextSpan>[
                TextSpan(
                    text: ' 2022',
                    style: TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    children: <TextSpan>[])
              ]),
        ),
        DropdownButton<String>(
          items: [],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
