import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

class CustomizedData extends StatefulWidget {
  CustomizedData({this.name, this.value});
  final String name;
  final int value;
  @override
  _CustomizedDataState createState() => _CustomizedDataState();
}

class _CustomizedDataState extends State<CustomizedData> {
  int value;
  @override
  void initState() {
    value = widget.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      value.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class MySubscription extends StatefulWidget {
  MySubscription({this.mods, this.boxes, this.month, this.span});
  final Map<String, int> mods;
  final String month, boxes, span;
  @override
  _MySubscriptionState createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {
  List<Widget> wids = [
    Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "CUSTOM BOX",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
    ),
    SizedBox(
      height: 10,
    )
  ];
  Null appendList() {
    widget.mods.forEach((key, value) {
      wids.add(CustomizedData(
        name: key,
        value: value,
      ));
    });
    wids.add(
      SizedBox(
        height: 20,
      ),
    );
    wids.add(Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.boxes,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "|",
                style: TextStyle(color: Colors.grey[300]),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.refresh,
                    color: Colors.grey,
                  ),
                  Text(
                    widget.span,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
    wids.add(Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        "Next Delivery - ${widget.month}",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    appendList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: kossetDarkPink, borderRadius: BorderRadius.circular(12), boxShadow: [
            BoxShadow(color: kossetLightPink, offset: Offset(0, 10), blurRadius: 10)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: wids,
        ),
      ),
    );
  }
}
