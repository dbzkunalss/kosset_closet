import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: pinkColor,
          child: Stack(
            children: <Widget>[
              Positioned(
                // top:
                // bottom: ,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: pinkColor,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 40.0),
                            blurRadius: 20.0)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                ),
              )
            ],
          )),
    );
  }
}
