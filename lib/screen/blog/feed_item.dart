import 'package:alarm_reminder/screen/blog/blog_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/space.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit sem arcu vitae.';
    String details =   'A full-text database is assemble of documents or other information in the form of a database in which the complete text of each referenced document is available for online viewing, printing, or downloading. In addition to text documents, images are often included, such as graphs, maps, photos, and diagrams. A full-text database is searchable by keyword, phrase, or both. When a document appears as a PDF file, it is usually a scanned hardcopy of the original article, chapter, or book. Full-text databases are ideally suited to online courses of study, where the reader remains at their place and obtain materials by downloading them from online. Full-text databases are also used by the U.S Internal Revenue Service and most state departments of revenue are good examples.';

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

              leading: FlutterLogo(size: 30,),
              title:  Text(
                'Admin',

                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              subtitle:     Text(
                '15 minutes ago',
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
                    builder: (context) =>  BlogDetails(title: title,details: details,),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20 ),
                child: Column(
                  children: [
                    Text(
                      title,
                        style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    Space.Y(13),
                    Text(
                      details,
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