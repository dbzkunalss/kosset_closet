import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 40),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "KOSSET ",
                    style: TextStyle(color: Color(0xFFF17791), fontSize: 24)),
                TextSpan(
                    text: "CLOSET",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800))
              ]),
            ),
            Image.asset(
              "assets/Group 18.png",
              scale: 2,
            )
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
