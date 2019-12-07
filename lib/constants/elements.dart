import 'package:flutter/material.dart';

import 'color.dart';

TextField textfield(String hint, Icon icon, {bool obt: false, TextInputType keyboard: TextInputType.emailAddress}) {
  return TextField(
    obscureText: obt,
      keyboardType: keyboard,
      style: TextStyle(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: pinkColor)),
        hintText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey),
        prefixIcon: icon,
      ));
}
