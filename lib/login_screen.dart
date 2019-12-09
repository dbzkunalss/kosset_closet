import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:kosset_closet/constants/elements.dart';
import 'package:kosset_closet/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: pinkColor,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
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
              height: MediaQuery.of(context).size.height * 0.7,
              alignment: Alignment.bottomCenter,
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
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: pinkColor,
                        ),
                        child: textfield("E-mail", Icon(Icons.email))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: pinkColor,
                        ),
                        child: textfield("Password", Icon(Icons.vpn_key), obt: true)
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        onTap: () {
                          print("works");
                        },
                      ),
                    ),
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
                            "LOGIN",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(229, 116, 133, 1),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: purpleFromThePallet),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FloatingActionButton.extended(
                          heroTag: "2",
                          elevation: 0,
                          label: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: purpleFromThePallet,
                                fontWeight: FontWeight.w800),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: purpleFromThePallet),
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FloatingActionButton.extended(
                          heroTag: "3",
                          elevation: 0,
                          icon: Image.network(
                            "https://img.icons8.com/bubbles/2x/google-logo.png",
                            width: 30,
                          ),
                          label: Text(
                            "SIGN IN WITH GOOGLE",
                            style: TextStyle(
                                color: purpleFromThePallet,
                                fontWeight: FontWeight.w800),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
