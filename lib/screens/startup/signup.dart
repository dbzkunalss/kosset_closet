import 'package:flutter/material.dart';
import 'package:kosset_closet/api/auth.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/constants/misc.dart';
import 'package:kosset_closet/constants/text_fields.dart';
import 'package:kosset_closet/screens/period/when_period.dart';
import 'package:hive/hive.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget signUpText;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String username = "";

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
                        child: Form(
                          key: _formkey,
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
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? "Enter Username" : null,
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                                decoration: InputDecoration(
                                    hintText: "Username",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.face)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(email)
                                        ? "Please enter a valid email id"
                                        : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.email)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? "Enter password" : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.lock)),
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
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    setState(() {
                                      signUpText = CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      );
                                    });
                                    // dynamic result = await _auth.createUser(email: email, password: password);
                                    // if (result != null) {
                                      // final Box<dynamic> box = await Hive.openBox("user");
                                      // box.put("email", email);
                                      // box.put("password", password);
                                      // box.put("uid", result.uid);
                                      Navigator.pushReplacement(
                                          context, 
                                          MaterialPageRoute(
                                              builder: (_) => LastPeriod()));
                                    // }
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              FlatButtonDefault(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(color: Colors.white),
                                ),
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
                        )),
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
