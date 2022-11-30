import 'package:alarm_reminder/screen/blog/blog_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/space.dart';

class FeedItem extends StatelessWidget {
  final body;
  final head;
  DateTime date;
  FeedItem({Key? key, this.body, this.head, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(

              leading: Image.asset('assets/img/logo.png', width: 30, height: 30,),
              title:  Text(
                'Medring+',

                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              subtitle:     Text(
                "${date.month }:${date.day } - ${date.hour }:${date.minute }",
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
              ),
              trailing: IconButton(
                icon: Icon(Icons.more_horiz_outlined, color: Colors.black,),
                onPressed: (){},
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  BlogDetails(title: head,details: body,),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      head,
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    Space.Y(13),
                    Text(
                      body,
                        maxLines: 4, overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}