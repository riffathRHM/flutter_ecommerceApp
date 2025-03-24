import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/Order.dart';
import 'package:shopping_app/pages/Profile.dart';
import 'package:shopping_app/pages/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  //late ussing for non-nullable values
  late Home HomePage;
  late Order order;
  late Profile profile;
  int currentTabIndex = 0;

  @override
  void initState() {
    HomePage = Home();
    order = Order();
    profile = Profile();
    pages = [HomePage, order, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor:  Color(0xfff2f2f2),
          color: Colors.black,
          animationDuration: Duration(microseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(Icons.home_outlined, color: Colors.white),
            Icon(Icons.shopping_bag_outlined, color: Colors.white),
            Icon(Icons.person_outlined, color: Colors.white),
          ]),
          body: pages[currentTabIndex],
    );
  }
}
