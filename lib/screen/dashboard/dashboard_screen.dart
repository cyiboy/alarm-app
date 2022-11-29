import 'package:alarm_reminder/screen/blog/blog_screen.dart';
import 'package:alarm_reminder/screen/home/home_screen.dart';
import 'package:alarm_reminder/screen/profile/profile_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboardScreen extends StatefulWidget {
  final user;

  const dashboardScreen({super.key,  this.user});
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  int _currentIndex = 0;
  int _pageIndex = 0;
  late PageController _pageController;
  bool _isVisible = true;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[HomeScreen(), BlogScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        enableFloatingNavBar: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        curve: Curves.bounceIn,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        // dotIndicatorColor: Colors.black,
        items: [
          DotNavigationBarItem(
              icon: Icon(Icons.history_toggle_off), unselectedColor: Colors.grey),
          DotNavigationBarItem(
              icon: Icon(Icons.newspaper),
              unselectedColor: Colors.grey),
          DotNavigationBarItem(
              icon: Icon(Icons.person), unselectedColor: Colors.grey),
        ],
      ),
    );
  }
}