import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';

class CustomizerButton extends StatefulWidget {
  CustomizerButton({this.name, this.value, this.isStatic});
  final String name;
  final int value;
  final bool isStatic;
  @override
  _CustomizerButtonState createState() => _CustomizerButtonState();
}

class _CustomizerButtonState extends State<CustomizerButton> {
  int value;
  @override
  void initState() {
    value = widget.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            width: widget.isStatic == true
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.4,
            child: Text(
              widget.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        widget.isStatic == true
            ? Container(
                height: 60,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            value -= 1;
                          });
                          print(value);
                        },
                        child: Icon(
                          Icons.remove,
                        )),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            value += 1;
                          });
                        },
                        child: Icon(
                          Icons.add,
                        )),
                  )
                ],
              )
      ],
    );
  }
}

class Product extends StatefulWidget {
  Product(
      {this.options,
      this.name,
      this.shortDesc,
      this.additional,
      this.longDesc,
      this.head,
      this.mods,
      this.isStatic});
  final String name, shortDesc, additional, longDesc, head;
  final bool options;
  final Map<String, int> mods;
  final bool isStatic;

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Widget> blueBox;
  @override
  void initState() {
    // TODO: implement initState
    blueBox = [
      widget.isStatic == false
          ? Text(
              widget.head,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            )
          : Container(),
      widget.isStatic == false
          ? Divider(
              color: Colors.white,
            )
          : Container(),
    ];
    appendList();
    super.initState();
  }

  Null appendList() {
    widget.mods.forEach((key, value) {
      blueBox.add(CustomizerButton(
        name: key,
        value: value,
        isStatic: widget.isStatic,
      ));
    });
    blueBox.add(
      SizedBox(
        height: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Image.asset("assets/kossetBoxFull.png"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: kossetDarkPink,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              widget.shortDesc,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          widget.isStatic == false
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    widget.additional,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: kossetDarkPink,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          widget.isStatic == false
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    widget.longDesc,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(color: kossetLighterBlue),
              // height: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: blueBox,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlineButton(
                      highlightColor: kossetPurpleFromThePallet,
                      borderSide: BorderSide(color: kossetPurpleFromThePallet),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: kossetPurpleFromThePallet,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FlatButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )),
                    color: kossetDarkPink,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          widget.isStatic == false || widget.isStatic == null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: FlatButton(
                          color: kossetPurpleFromThePallet,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text("Subscribe",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                )),
                          ))),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
