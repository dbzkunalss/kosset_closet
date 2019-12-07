import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(accentColor: pinkColor, fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
