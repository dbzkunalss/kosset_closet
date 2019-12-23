import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "UH OH!",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(104, 0, 0, 0),
                  fontSize: 24),
            ),
            Text(
              "No Internet Connection",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(Color.getAlphaFromOpacity(41), 0, 0, 0),
                  fontSize: 24),
            ),
            Text(
              "Try checking your mobile data or Wifi Connection",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(Color.getAlphaFromOpacity(41), 0, 0, 0),
                  fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset("assets/blankCanvasWOman.png"),
            )
          ],
        ),
      ),
    );
  }
}
