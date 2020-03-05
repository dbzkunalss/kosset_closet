import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/widgets/app_bar_default.dart';
import 'home_screens/products.dart';
import 'home_screens/profile.dart';
import 'home_screens/subscription.dart';
import 'home_screens/tracker.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex;

  List<Widget> list = [Tracker(), Products(), Subscription(), Profile()];

  @override
  void initState(){
    _currentIndex = 0;
    // TODO: implement initState
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: defaultAppBar(),
        floatingActionButton: _currentIndex == 1
            ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,

                child: FloatingActionButton(
                  onPressed: null,
                  child: Image.asset("assets/shoppingCart.png"),
                  backgroundColor: kossetPurpleFromThePallet,
                ),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kossetDarkPink,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) async{
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
