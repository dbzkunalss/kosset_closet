import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/color.dart';
import 'package:kosset_closet/login_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(accentColor: pinkColor),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}