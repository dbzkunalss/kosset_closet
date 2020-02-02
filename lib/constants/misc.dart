import 'package:flutter/material.dart';

class FlatButtonDefault extends StatefulWidget {
  FlatButtonDefault({Key keys, this.onPressed, this.child, this.buttonColor});
  final Function onPressed;
  final Widget child;
  final Color buttonColor;
  @override
  _FlatButtonDefaultState createState() => _FlatButtonDefaultState();
}

class _FlatButtonDefaultState extends State<FlatButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(5)
      ),
      height: 64,
      child: FlatButton(
      
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}


class OutlinedButtonDefault extends StatefulWidget {
  OutlinedButtonDefault({Key keys, this.onPressed, this.child, this.buttonColor});
  final Function onPressed;
  final Widget child;
  final Color buttonColor;
  @override
  _OutlinedButtonDefaultState createState() => _OutlinedButtonDefaultState();
}

class _OutlinedButtonDefaultState extends State<OutlinedButtonDefault> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
    child: OutlineButton(
      borderSide: BorderSide(
        width: 1.5,
        color: widget.buttonColor
      ),
      
      textColor: widget.buttonColor,
      color: widget.buttonColor,
      splashColor: widget.buttonColor,
      child: widget.child,
      onPressed: widget.onPressed
      ));
  }
}