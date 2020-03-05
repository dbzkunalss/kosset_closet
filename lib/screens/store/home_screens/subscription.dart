import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/store/misc_widgets/my_subscription.dart';
import 'package:kosset_closet/screens/store/misc_widgets/subscriptionProduct.dart';
import 'package:kosset_closet/screens/store/summary.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final List<String> boxes = [
    '5 BOXES',
    '4 BOXES',
    '3 BOXES',
    '2 BOXES',
    '1 BOX'
  ];
  String selectedBox;
  final List<String> months = [
    'Once in a month',
    'Twice in a month',
    'Thrice in a month'
  ];
  String selectedMonth;
  @override
  void initState() {
    selectedBox = boxes[0];
    selectedMonth = months[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: kossetDarkPink,
                  boxShadow: [
                    BoxShadow(
                        color: kossetLightPink,
                        offset: Offset(0, 10),
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Center(
                  child: Text(
                    "Set up your Kosset Subscription in a minute, to never worry about last minute troubles ever again. The Closet will deliver your Custom Kosset Box to your doorstep as per your period cycle and chosen frequency. You can edit, skip or unsubscribe anytime you want.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SubscriptionProduct(
            additional: "+ FREE HERBAL PERIOD CRAMPS RELIEF ROLL ON",
            shortDesc: "15 Sanitary Pads with Individual Disposal Packets",
            someHead: "Make your Custom Box",
            name: "KOSSET BOX",
            head: "Standard Box",
            mods: {
              "Heavy Flow and Overnight Pads (L)": 6,
              "Light and Medium Flow Pads (M)": 7,
              "Panty Liners for light spotting and discharge": 2
            },
            isStatic: false,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text("How many Kosset Boxes do you want per order?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: kossetPurpleFromThePallet, width: 3)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: null,
                      style: TextStyle(color: kossetPurpleFromThePallet),
                      value: selectedBox,
                      items: boxes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: kossetPurpleFromThePallet),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {
                        setState(() {
                          selectedBox = _;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Text("How frequently do you want your order delivered?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: kossetPurpleFromThePallet, width: 3)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: null,
                      style: TextStyle(color: kossetPurpleFromThePallet),
                      value: selectedMonth,
                      items: months.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: kossetPurpleFromThePallet),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {
                        setState(() {
                          selectedMonth = _;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: FlatButton(
                    color: kossetPurpleFromThePallet,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text("Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )),
                    ))),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class OnSubScribed extends StatefulWidget {
  @override
  _OnSubScribedState createState() => _OnSubScribedState();
}

class _OnSubScribedState extends State<OnSubScribed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: MySubscription(
              mods: {
                "Heavy Flow and Overnight Pads (L)": 6,
                "Light and Medium Flow Pads (M)": 7,
                "Panty Liners for light spotting and discharge": 2
              },
              boxes: "5 BOXES",
              span: "Once in a month",
              month: "March",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: kossetPurpleFromThePallet,
                  boxShadow: [
                    BoxShadow(
                        color: kossetPurpleFromThePallet,
                        offset: Offset(0, 10),
                        blurRadius: 30)
                  ],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: DeliveryAddress(
                  address:
                      "S-101, Nillenium Park, Civil Line, Los Santos California, USA, 400005",
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: Colors.grey)
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text("Payment Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        true
                            ? FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "ON THE GO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                color: kossetDarkPink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : OutlineButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {},
                                child: Text(
                                  "Switch to On The Go",
                                  style: TextStyle(
                                      color: kossetDarkPink, fontSize: 13),
                                ),
                                color: kossetDarkPink,
                                borderSide: BorderSide(color: kossetDarkPink),
                              ),
                        false
                            ? FlatButton(
                                onPressed: () {},
                                child: Text('AUTO DEBIT',
                                    style: TextStyle(color: Colors.white)),
                                color: kossetDarkPink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : OutlineButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {},
                                child: Text(
                                  "Switch to Autodebit",
                                  style: TextStyle(color: kossetDarkPink),
                                ),
                                color: kossetDarkPink,
                                borderSide: BorderSide(color: kossetDarkPink),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Container(
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text(
                  "Edit Subscription",
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Container(
              child: OutlineButton(
                borderSide: BorderSide(color: kossetDarkPink, width: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Pause Subscription",
                    style: TextStyle(
                        color: kossetDarkPink,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Container(
              child: FlatButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Unsubscribe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                color: Color(0xFF747474),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
