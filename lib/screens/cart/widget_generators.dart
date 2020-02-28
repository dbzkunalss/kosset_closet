import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

List<Widget> generateQuantity(Map<String, String> items, BuildContext context) {
  List<Widget> list = [];
  items.forEach((key, value) {
    list.add(Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              key,
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
              height: 23,
              width: 23,
              decoration: BoxDecoration(color: kossetLightBlue),
              child: Center(
                  child: Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )))
        ],
      ),
    ));
  });
  return list;
}
