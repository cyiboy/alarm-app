import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../local_stroage_repositroy.dart';
import '../../widget/space.dart';
import '../blog/feed_item.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  late final ReminderData _localStorageRepository;
  List save = [];
  bool loading = false;
  openBox () async{
    save = [];
    setState(() {
      loading = true;
    });
    Box box = await _localStorageRepository.OpenSaveBox();
    setState(() {
      loading = false;
    });
   save = _localStorageRepository.getSaveAll(box);
print(save);
  }
  @override
  void initState() {
    // TODO: implement initState
    _localStorageRepository = ReminderData();
    openBox();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: loading  == true?
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
                "Saved Newsfeeds",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color:Colors.black),
              ),
              Space.Y(20),
              save.isEmpty?
                  Center(child: Column(
                    children: [
                      Space.Y(Get.height * 0.2),
                      Icon(Icons.hourglass_empty, size: Get.height * 0.2,),
                      Space.Y(Get.height * 0.1),
                      Text(
                        "No Saved Newsfeeds",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color:Colors.black),
                      ),
                    ],
                  )):Column(
                children: [
                  for(var element in save)
                    FeedItem(head: element['head'], body: element['body'], date: DateTime.now())

                ],
              )


            ],
          ),
        ),
      ));

  }
}
