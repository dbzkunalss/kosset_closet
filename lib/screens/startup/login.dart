import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/constants/misc.dart';
import 'package:kosset_closet/constants/text_fields.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kossetLightPink,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: kossetLightPink,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1),
                        children: [
                          TextSpan(
                              text: "KOSSET™ ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300)),
                          TextSpan(
                              text: "Closet",
                              style: TextStyle(
                                  color: kossetDarkPink,
                                  fontWeight: FontWeight.w800)),
                          TextSpan(
                              text: "\nSome relevant tagline",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300))
                        ]),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: kossetDarkPink,
                        offset: Offset(0, 0),
                        // spreadRadius: 2,
                        blurRadius: 50)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: ListView(
                  children: <Widget>[
                    DefaultTextFields(
                      "Email",
                      Icon(Icons.email),
                      bordercolor: Color(0xFFBFBFBF),
                      obt: false,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DefaultTextFields(
                      "password",
                      Icon(Icons.lock),
                      bordercolor: Color(0xFFBFBFBF),
                      obt: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text("Forgot your password?", style: TextStyle(color: Color(0xFFBFBFBF)),),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButtonDefault(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      buttonColor: kossetDefaultButton,
                      onPressed: () {
                        print("ok");
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
