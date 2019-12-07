import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';

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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: pinkColor,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: pinkColor)),
                              hintText: "E-mail",
                              prefixIcon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: pinkColor,
                        ),
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: pinkColor)),
                              hintText: "Password",
                              prefixIcon: Icon(Icons.vpn_key)),
                        ),
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                            color: pinkColor,
                            offset: Offset(0.0, 5),
                            blurRadius:  10,
                          ),]
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FloatingActionButton.extended(
                          label: Text("LOGIN"),
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(229, 116, 133, 1),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          onPressed: (){
                            
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FloatingActionButton.extended(
                          elevation: 2,
                          label: Text("SIGN UP", style: TextStyle(color: Colors.deepPurple),),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          onPressed: (){
                            
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: FloatingActionButton.extended(
                          elevation: 2,
                          icon: Image.network("https://img.icons8.com/bubbles/2x/google-logo.png", width: 30,),
                          label: Text("SIGN IN WITH GOOGLE", style: TextStyle(color: Colors.grey),),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          onPressed: (){
                            
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
    );
  }
}
