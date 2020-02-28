import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/cart/widget_generators.dart';

class CartItem extends StatefulWidget {
  CartItem({this.name, this.addon, this.items, this.numberOfBoxes, this.onTap});
  final String name;
  final String addon;
  final Map<String, String> items;
  final String numberOfBoxes;
  final Function onTap;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 3),
              spreadRadius: 1,
              blurRadius: 20)
        ]),
        child: Stack(
          children: <Widget>[
            Positioned(
                right: -1,
                top: -2,
                child: Container(
                  height: 30,
                  width: 30,
                  color: kossetDarkPink,
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: Center(
                        child: Text(
                      "X",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.name,
                              // KOSSET BOX
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                widget.addon,
                                //"+ FREE HERBAL PERIOD CRAMPS RELIEF ROLL ON"
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kossetDarkPink),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: generateQuantity(widget.items, context),
                              // {
                              //   "Heavy Flow and Overnight Pads (L)": "6",
                              //   "Light and Medium Flow Pads (M)": "7",
                              //   "Panty Liners for light spotting and discharge":
                              //       "2"
                              // }
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(color: kossetPurpleFromThePallet),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Choice of boxes: ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Text("${widget.numberOfBoxes} BOXES",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
