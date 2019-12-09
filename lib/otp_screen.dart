import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:pin_view/pin_view.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final String phone = "893  274  0420";
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Verification",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 25, color: Colors.black),
        ),
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: FittedBox(
              child: FloatingActionButton(
                mini: true,
                child: Icon(Icons.arrow_back_ios),
                foregroundColor: Colors.white,
                backgroundColor: purpleFromThePallet,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Confirm your Phone Number",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "+91 " + phone,
                          style: TextStyle(
                              color: purpleFromThePallet, fontSize: 32),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: purpleFromThePallet,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: ListView(
                  children: <Widget>[
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, right: 120, bottom: 20),
                          child: Text(
                            "Type your OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, right: 50),
                          child: Text(
                              "Enter the verification code we sent to your\nphone number",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: PinView(
                              inputDecoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(64, 255, 255, 255),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              count: 4, // describes the field number
                              // positions of dashes, you can add multiple
                              autoFocusFirstField: false, // defaults to true
                              margin: EdgeInsets.all(10),
                              // margin between the fields
                              obscureText:
                                  false, // describes whether the text fields should be obscure or not, defaults to false
                              style: TextStyle(
                                  // style for the fields
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w500),
                              dashStyle: TextStyle(
                                  // dash style
                                  fontSize: 25.0,
                                  color: Colors.grey),
                              submit: (String pinNow) {
                                // when all the fields are filled
                                // submit function runs with the pin
                                pin = pinNow;
                                print(pin);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(225, 236, 149, 162)),
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
                                print(pin);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: InkWell(
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
