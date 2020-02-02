import 'package:flutter/material.dart';
import 'package:kosset_closet/api/statup_states.dart';
import 'package:kosset_closet/constants/colors.dart';

import 'startup/login.dart';
import 'store/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLoggedIn().then((value) {
      if (value) {
        Future.delayed(Duration(seconds: 3)).then((onValue) =>
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())));
      } else {
        hasSkipped().then((skipped) {
          if (skipped) {
            Future.delayed(Duration(seconds: 3)).then((onValue) =>
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home())));
          } else {
            Future.delayed(Duration(seconds: 3)).then((onValue) =>
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login())));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1),
                  children: [
                    TextSpan(
                        text: "Kosset™ ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: "Closet",
                        style: TextStyle(
                            color: kossetDarkPink, fontWeight: FontWeight.w800))
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kossetDarkPink),
            )
          ],
        ),
      ),
    );
  }
}
