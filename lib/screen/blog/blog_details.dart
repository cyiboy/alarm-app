import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/space.dart';

class BlogDetails extends StatelessWidget {
  final title;
  final details;
  const BlogDetails({this.title, this.details,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
                 style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            Space.Y(20),
            Text(
              details,

              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
            ),


          ],
        ),
      ),
    );
  }
}
