import 'package:alarm_reminder/screen/blog/feed_item.dart';
import 'package:alarm_reminder/widget/space.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/botton.dart';
import '../../widget/input.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
late FirebaseFirestore db;
TextEditingController heading = TextEditingController();

TextEditingController body = TextEditingController();
List post = [];

  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    getPost();
    super.initState();
  }
  bool loading = false;
bool loadingPost = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: loadingPost == true?
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(),
                ),
              ):

          Column(
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
              for(var element in post)
              FeedItem(head: element['Heading'], body: element['body'], date: (element['dateTime'] as Timestamp).toDate() ,),

            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     showModalBottomSheet<void>(
      //         context: context,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20.0),
      //         ),
      //         backgroundColor: Colors.white,
      //         builder: (BuildContext context) {
      //           return Container(
      //             padding: EdgeInsets.all(15),
      //             height: 500,
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   Text(
      //                     'Create New Newsfeeds...',
      //                     style: TextStyle(
      //                         fontSize: 15,
      //                         fontWeight: FontWeight.w600,
      //                         color: Colors.black),
      //                   ),
      //                   Space.Y(20),
      //                   Input(hint: 'Heading',
      //                   controller: heading,
      //                   type: InputType.text,),
      //                   Space.Y(20),
      //                   Input.multi(
      //                     hint: "what on your Mind",
      //                     controller: body,
      //                     type: InputType.text,
      //
      //                       lines: 7,
      //                   ),
      //                   Space.Y(20),
      //                   Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Column(
      //                       children: [
      //                         Press.bold('Post',
      //                           loading: loading,
      //                           onPressed: (){
      //                           createPost();
      //                         },
      //
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //
      //                 ],
      //               ),
      //             ),
      //           );
      //         });
      //   },
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add, color: Colors.white,),
      // ),
    );
  }

  createPost() async {
    setState(() {
      loading = true;
    });
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "Heading": heading.text,
      "body": body.text,
      "dateTime": DateTime.now()
    };

// Add a new document with a generated ID
   await db.collection("post").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    setState(() {
      loading = false;
    });
    heading.text = "";
    body.text ="";
    Navigator.of(context).pop();
    getPost();
  }
  getPost() async {
    setState(() {
      loadingPost = true;
    });
    await db.collection("post").get().then((event) {
      for (var doc in event.docs) {
        post.add(doc.data());
        print("${doc.id} => ${doc.data()}");
        print("${doc.data()['dateTime'].seconds}");
      }
    });
    setState(() {
      loadingPost = false;
    });
  }
}
