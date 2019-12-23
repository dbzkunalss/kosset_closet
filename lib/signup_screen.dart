import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:kosset_closet/constants/elements.dart';
import 'package:kosset_closet/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser user;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: pinkColor,
          child: Form(
            key: _formKey,
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
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/Woman.png"),
                                width: 80,
                              ),
                            ],
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
                                child: textfield("Email", Icon(Icons.email),
                                    cnt: _emailController,
                                    validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                })),
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
                                  obt: true, cnt: _passwordController,
                                  validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              })),
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
                                backgroundColor:
                                    Color.fromRGBO(229, 116, 133, 1),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _register();
                                  }
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
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
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void clearFields() {
    _formKey.currentState.reset();
    // _emailController.clear();
    _passwordController.clear();
  }

  // Example code for registration.
  void _register() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.toString().trim(),
        password: _passwordController.text.toString().trim(),
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen()),
          );
        });
      } else {
        _success = false;
      }
    } catch (e) {
      showDialog(
          context: context,
          child: AlertDialog(
            title: new Text("Hol' Up"),
            content: new Text(e.message),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  clearFields();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));

      print(e);
    }
  }
}
