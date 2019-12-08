import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:kosset_closet/constants/elements.dart';
import 'package:kosset_closet/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: pinkColor,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(color: pinkColor),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "KOSSET™",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 34),
                          ),
                          Text(
                            "Closet",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: pinkColorShadow,
                                fontSize: 34),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Some relevent Tag-Line",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: pinkColorShadow,
                        offset: Offset(0.0, -20.0),
                        blurRadius: 50.0)
                  ],
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: pinkColorShadow,
                            offset: Offset(0.0, -20.0),
                            blurRadius: 50.0)
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.66,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/Woman.png"),
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 20),
                          child: Theme(
                              data: Theme.of(context).copyWith(
                                primaryColor: pinkColor,
                              ),
                              child: textfield("Name", Icon(Icons.person))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Theme(
                              data: Theme.of(context).copyWith(
                                primaryColor: pinkColor,
                              ),
                              child: textfield("Email", Icon(Icons.email))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: pinkColor,
                            ),
                            child: textfield(
                                "Phone Number", Icon(Icons.phone_android),
                                keyboard: TextInputType.phone),
                          ),
                        ),
                        Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: pinkColor,
                            ),
                            child: textfield("Password", Icon(Icons.vpn_key),
                                obt: true)),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: pinkColor,
                                offset: Offset(0.0, 5),
                                blurRadius: 10,
                              ),
                            ]),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: FloatingActionButton.extended(
                              heroTag: "1",
                              label: Text(
                                "SIGN UP",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromRGBO(229, 116, 133, 1),
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen()),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            decoration: BoxDecoration(),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: FloatingActionButton.extended(
                              heroTag: "2",
                              label: Text(
                                "LOGIN",
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: purpleFromThePallet,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
