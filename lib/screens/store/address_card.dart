import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  AddressCard({this.name, this.address});
  final String name;
  final String address;

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Container(
          height: 216,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  // "Jane Doe",
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          widget.address,
                          // "S-101, Nillenium Park, Civil Line Los Santos California, USA, 400005",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/delete 1.png",
                        scale: 2,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
