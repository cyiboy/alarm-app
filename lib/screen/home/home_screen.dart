import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create_plan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  CreatePlan(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white,),
      ),

    );
  }
}
