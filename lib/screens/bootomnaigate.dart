import 'package:dashboard/constants.dart';
import 'package:dashboard/screens/profile/profile.dart';
import 'package:dashboard/screens/view_all_customer.dare/customers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Statics/Statics.dart';
import 'main/main_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainScreen(),
    ViewAllCustomer(),
    StatisticsScreen(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        border: Border.all(style: BorderStyle.none),
        backgroundColor: secondaryColor,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'view all',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
