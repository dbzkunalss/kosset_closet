import 'package:flutter/material.dart';
import 'package:kosset_closet/login_screen.dart';
import 'constants/elements.dart';
import 'constants/color.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotPwd extends StatefulWidget {
  @override
  _ForgotPwdState createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: pinkColor,
        child: Form(
          key: _formKey,
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
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: pinkColor,
                            ),
                            child: textfield("Email", Icon(Icons.email),
                                cnt: _emailController)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
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
                              "RESET",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(229, 116, 133, 1),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              resetPassword(_emailController.text);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          child: AlertDialog(
            title: new Text("Success"),
            content: new Text("Password reset link has been sent to " +
                _emailController.text +
                " with password reset instructions."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Go back to login"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ));
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));

      print(e);
    } 
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
