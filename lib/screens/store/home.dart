import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/widgets/app_bar_default.dart';
import 'home_screens/cart.dart';
import 'home_screens/profile.dart';
import 'home_screens/subscription.dart';
import 'home_screens/tracker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex;

  List<Widget> list = [Tracker(), Subscription(), Cart(), Profile()];

  @override
  void initState() {
    _currentIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kossetDarkPink,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/tabIcons/calendar(1) 1.png",
                  scale: 2,
                ),
                activeIcon: Image.asset(
                  "assets/tabIcons/calendar(1) 1.png",
                  scale: 2,
                  color: kossetDarkPink,
                ),
                title: Text(" ")),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/tabIcons/products.png",
                  scale: 2,
                ),
                activeIcon: Image.asset(
                  "assets/tabIcons/products.png",
                  scale: 2,
                  color: kossetDarkPink,
                ),
                title: Text(" ")),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/tabIcons/renew 1.png",
                  scale: 2,
                ),
                activeIcon: Image.asset(
                  "assets/tabIcons/renew 1.png",
                  scale: 2,
                  color: kossetDarkPink,
                ),
                title: Text(" ")),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/tabIcons/profile.png",
                  scale: 2,
                ),
                activeIcon: Image.asset(
                  "assets/tabIcons/profile.png",
                  scale: 2,
                  color: kossetDarkPink,
                ),
                title: Text(" ")),
          ],
        ),
        body: list.elementAt(_currentIndex));
  }
}

// [Tracker(), Subscription(), Cart(), Profile()]
