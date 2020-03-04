import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

Widget spacc(Widget widget, double height) {
  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: height,
        ),
        widget,
        SizedBox(
          height: height,
        )
      ],
    ),
  );
}

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          spacc(Demographic(), 20),
          Divider(),
          spacc(DeliveryAddress(), 20),
          Divider(),
          spacc(Bill(), 30),
        ],
      ),
    );
  }
}

class Demographic extends StatefulWidget {
  @override
  _DemographicState createState() => _DemographicState();
}

class _DemographicState extends State<Demographic> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset("assets/undraw_female_avatar_l3ey 1.png")
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Jane Doe",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text("janedoe@gmail.com", style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 5,
            ),
            Text("+91 6248937407")
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ],
    );
  }
}

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Delivery Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                    "S-101, Nillenium Park, Civil Line, Los Santos California, USA, 400005"))
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1)
      ],
    );
  }
}

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "SUBTOTAL",
                style: TextStyle(fontSize: 14),
              ),
              Text("₹450")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "SHIPPING CHARGES",
                style: TextStyle(fontSize: 14),
              ),
              Text("₹50")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "DISCOUNT",
                style: TextStyle(fontSize: 14),
              ),
              Text("₹0")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "TOTAL",
                style: TextStyle(fontSize: 14, color: kossetDarkPink),
              ),
              Text(
                "₹500",
                style: TextStyle(color: kossetDarkPink),
              )
            ],
          ),
        ],
      ),
    );
  }
}
