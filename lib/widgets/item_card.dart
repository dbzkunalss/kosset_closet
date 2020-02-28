import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  ItemCard({
    this.cardColor, 
    this.imagePath, 
    this.shadowColor,
    this.description,
    this.productName
    });
  final Color cardColor;
  final Color shadowColor;
  final String imagePath;
  final String description;
  final String productName;
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: widget.shadowColor,
                  offset: Offset(0, 10),
                  spreadRadius: 5,
                  blurRadius: 20)
            ]),
        height: MediaQuery.of(context).size.height * 0.23,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          widget.imagePath,
                          height: MediaQuery.of(context).size.height * 0.12,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.description,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset("assets/add-to-basket 1.png", scale: 1)
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
