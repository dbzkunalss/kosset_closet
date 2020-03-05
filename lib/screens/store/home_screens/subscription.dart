import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/store/misc_widgets/subscriptionProduct.dart';

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
                  borderRadius: BorderRadius.circular(10)),
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
                      borderRadius: BorderRadius.circular(10),
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
                      borderRadius: BorderRadius.circular(10),
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
                        borderRadius: BorderRadius.circular(10)),
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
