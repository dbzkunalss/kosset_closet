import 'package:flutter/material.dart';
import 'package:kosset_closet/widgets/app_bar_default.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: defaultAppBar());
  }
}
