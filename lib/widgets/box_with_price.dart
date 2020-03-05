import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

class BoxWithPrice extends StatefulWidget {
  BoxWithPrice({this.name, this.price});
  final String name;
  final String price;

  @override
  _BoxWithPriceState createState() => _BoxWithPriceState();
}

class _BoxWithPriceState extends State<BoxWithPrice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5, 1),
                  spreadRadius: 5,
                  blurRadius: 20)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.name,
              style: TextStyle(color: kossetTextPink, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.price,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
