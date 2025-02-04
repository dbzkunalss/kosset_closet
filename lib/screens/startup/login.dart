import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/constants/misc.dart';
import 'package:kosset_closet/constants/text_fields.dart';
import 'package:kosset_closet/screens/startup/signup.dart';
import 'package:kosset_closet/screens/store/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget loginText;
  @override
  void initState() {
    loginText = Text(
      "LOGIN",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kossetLightPink,
      body: CustomScrollView(
        slivers: <Widget>[
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
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
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
                      padding:
                          const EdgeInsets.only(top: 30, left: 45, right: 45),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                            onTap: () {},
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(color: Color(0xFFBFBFBF)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButtonDefault(
                            child: loginText,
                            buttonColor: kossetDefaultButton,
                            onPressed: () {
                              setState(() {
                                loginText = CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                );
                              });
                              print("ok");
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          OutlinedButtonDefault(
                            buttonColor: Color(0xFFC8BDE4),
                            child: Text("SIGN UP",
                                style: TextStyle(
                                    color: Color(0xFFC8BDE4),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          OutlinedButtonDefault(
                            buttonColor: Color(0xFFC8BDE4),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/icons8-google-400.png",
                                    width: 30,
                                  ),
                                  Text("  SIGN IN WITH GOOGLE",
                                      style: TextStyle(
                                          color: Color(0xFFC8BDE4),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15))
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "SKIP",
                                      style: TextStyle(
                                          color: Color(0xFFC8BDE4),
                                          fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFC8BDE4),
                                      size: 30,
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
