import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  bool isLoggedin;

  @HiveField(1)
  bool skip;

  @HiveField(2)
  String name;

  @HiveField(3)
  String email;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String password;

  @HiveField(6)
  DateTime last_date;

  @HiveField(7)
  int days;

  @HiveField(8)
  int cycle;

  @HiveField(9)
  int paymentMethod;

  @HiveField(10)
  int uid;

  User({this.cycle, this.days,this.email,this.isLoggedin, this.name, this.password, this.paymentMethod, this.phone, this.skip, this.last_date, this.uid});
}
