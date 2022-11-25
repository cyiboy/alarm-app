import 'package:flutter/material.dart';

Container buildCustomButton({required IconData icon}) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 2)),
    child: Center(
      child: Icon(icon),
    ),
  );
}
