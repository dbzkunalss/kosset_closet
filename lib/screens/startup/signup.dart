import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/constants/misc.dart';
import 'package:kosset_closet/constants/text_fields.dart';
import 'package:kosset_closet/screens/period/when_period.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget signUpText;
  @override
  void initState() {
    signUpText = Text(
      "SIGN UP",
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
                      padding: const EdgeInsets.only(left: 45, right: 45),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              "assets/undraw_female_avatar_l3ey 1.png",
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DefaultTextFields(
                            "Anurag",
                            Icon(Icons.person),
                            bordercolor: Color(0xFFBFBFBF),
                            obt: false,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DefaultTextFields(
                            "Email",
                            Icon(Icons.email),
                            bordercolor: Color(0xFFBFBFBF),
                            obt: true,
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
                            child: signUpText,
                            buttonColor: kossetDefaultButton,
                            onPressed: () {
                              setState(() {
                                signUpText = CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                );
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LastPeriod()));
                              });
                              print("ok");
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButtonDefault(
                            child: Text("LOGIN", style: TextStyle(color: Colors.white),),
                            buttonColor: Color(0xFFC8BDE4),
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
