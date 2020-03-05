import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget subscriptionStatus(BuildContext context,
    {bool isSubscribed, DateTime delivery, Color color}) {
  DateFormat formatter = DateFormat("MMMM");
  return Container(
    height: MediaQuery.of(context).size.height * 0.08,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Subscription", style: TextStyle(color: Colors.white),),
          Text("|", style: TextStyle(color: Colors.grey[300], fontSize: 28)),
          isSubscribed
              ? Text("Next Delivery: ${formatter.format(delivery)}", style: TextStyle(color: Colors.white))
              : Text("UN - Subscribed", style: TextStyle(color: Colors.white))
        ],
      ),
    ),
  );
}
