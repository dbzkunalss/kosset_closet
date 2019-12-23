import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:kosset_closet/constants/elements.dart';
import 'package:kosset_closet/homescreen.dart';
import 'package:kosset_closet/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'forgotPwd.dart';

//import 'main.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  String _userID;

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
                        padding: const EdgeInsets.only(top: 50, bottom: 30),
                        child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: pinkColor,
                            ),
                            child: textfield(
                              "E-mail",
                              Icon(Icons.email),
                              cnt: _emailController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: pinkColor,
                            ),
                            child: textfield(
                              "Password",
                              Icon(Icons.vpn_key),
                              obt: true,
                              cnt: _passwordController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            )),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            child: Text(
                              "Forgot your password?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPwd()),
                              );
                            }),
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _signInWithEmailAndPassword();
                                _success == null
                                    ? print('')
                                    : (_success)
                                        ? () {
                                            print(
                                                'Successfully signed in, uid: ' +
                                                    _userID);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()),
                                            );
                                          }
                                        : print('Sign in failed');
                              }
                            },
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
                            onPressed: () async {
                              _signInWithGoogle();
                              _success == null
                                  ? print('')
                                  : (_success)
                                      ? 
                                          print(
                                              'Successfully signed in, uid: ' +
                                                  _userID)
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           HomeScreen()),
                                          // );
                                        
                                      : print('Sign in failed');
                            },
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
      ),
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code of how to sign in with email and password.
  void _signInWithEmailAndPassword() async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
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

  void clearFields() {
    _formKey.currentState.reset();
    // _emailController.clear();
    _passwordController.clear();
  }

  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      setState(() {
        if (user != null) {
          _success = true;
          _userID = user.uid;
        } else {
          _success = false;
        }
      });
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
