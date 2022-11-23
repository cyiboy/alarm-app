import 'package:alarm_reminder/screen/blog/feed_item.dart';
import 'package:alarm_reminder/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/botton.dart';
import '../../widget/input.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.Y(50),
              Text(
                "Newsfeeds",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color:Colors.black),
              ),
              Space.Y(20),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(15),
                  height: 500,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Create New Newsfeeds...',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Space.Y(20),
                        Input(hint: 'Heading',
                        type: InputType.text,),
                        Space.Y(20),
                        Input.multi(
                          hint: "what on your Mind",
                          type: InputType.text,
                            lines: 7,
                        ),
                        Space.Y(20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Press.bold('Post', onPressed: (){},)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              });
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
