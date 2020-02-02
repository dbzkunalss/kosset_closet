import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

class DefaultTextFields extends StatefulWidget {
  DefaultTextFields(this.hint, this.icon,
      {Key keys,
      this.obt,
      this.keyboard,
      this.validator,
      this.cnt,
      this.suffix,
      this.bordercolor});
  bool obt = false;
  TextInputType keyboard = TextInputType.emailAddress;
  Function validator;
  TextEditingController cnt;
  Widget suffix;
  Color bordercolor = kossetDarkPink;
  String hint;
  Icon icon;
  @override
  _DefaultTextFieldsState createState() => _DefaultTextFieldsState();
}

class _DefaultTextFieldsState extends State<DefaultTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obt,
      keyboardType: widget.keyboard,
      style: TextStyle(color: widget.bordercolor),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, style: BorderStyle.solid, color: widget.bordercolor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.bordercolor)),
        hintText: widget.hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey),
        prefixIcon: widget.icon,
        suffix: widget.suffix,
      ),
      validator: widget.validator,
      controller: widget.cnt,
    );
  }
}
