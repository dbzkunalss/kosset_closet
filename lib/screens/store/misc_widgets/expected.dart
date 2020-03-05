import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kosset_closet/constants/colors.dart';

Widget expectedPeriod(DateTime start, DateTime end, BuildContext context,
    {Color color}) {
  DateFormat formatter = DateFormat('dd MMM');
  String days = end.difference(DateTime.now()).inDays.abs().toString();
  String formattedStart = formatter.format(start);
  String formattedEnd = formatter.format(end);
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color == null ? kossetDarkPink : color,
    ),
    child: Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Expected Period Dates",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 17),
                ),
                Text("\n$formattedStart - $formattedEnd",
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "PERIOD IN\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13)),
                      TextSpan(
                          text: days,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: "\nDAYS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13)),
                    ])),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget expectedFertile(DateTime start, DateTime end, BuildContext context,
    {Color color}) {
  DateFormat formatter = DateFormat('dd MMM');
  String days = end.difference(DateTime.now()).inDays.abs().toString();
  String formattedStart = formatter.format(start);
  String formattedEnd = formatter.format(end);
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color == null ? Color(0xFFC1D3E0) : color,
    ),
    child: Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              " Expected Fertile Dates\n",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 17),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("$formattedStart - $formattedEnd",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    Text("|", style: TextStyle(color: Colors.grey[300], fontSize: 28),),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: days,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: " DAYS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13)),
                    ])),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
