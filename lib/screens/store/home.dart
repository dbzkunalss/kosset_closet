import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/cart/cart_item.dart';
import 'package:kosset_closet/screens/store/address_card.dart';
import 'package:kosset_closet/screens/store/summary.dart';
import 'package:kosset_closet/widgets/app_bar_default.dart';
import 'package:kosset_closet/widgets/box_with_price.dart';
import 'package:kosset_closet/widgets/item_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: ListView(
        children: <Widget>[
          ItemCard(
            cardColor: kossetDarkPink,
            imagePath: "assets/kossetBox.png",
            shadowColor: kossetLightPink,
            description: "15 Sanitary Pads with Individual Disposal Packets",
            productName: "KOSSET BOX",
          ),
          ItemCard(
            cardColor: kossetPurpleFromThePallet,
            imagePath: "assets/kossetBox.png",
            shadowColor: Colors.grey,
            description: "3 Sanitary Pads with Individual Disposal Packets",
            productName: "TRIAL BOX",
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                BoxWithPrice(
                  name: "1 Box",
                  price: "₹ 250",
                ),
                BoxWithPrice(
                  name: "2 Box",
                  price: "₹ 400",
                ),
                BoxWithPrice(
                  name: "6 Box",
                  price: "₹ 1000",
                ),
              ],
            ),
          ),
          CartItem(
            name: "KOSSET BOX",
            addon: "+ FREE HERBAL PERIOD CRAMPS RELIEF ROLL ON",
            items: {
              "Heavy Flow and Overnight Pads (L)": "6",
              "Light and Medium Flow Pads (M)": "7",
              "Panty Liners for light spotting and discharge": "2"
            },
            numberOfBoxes: "2",
            onTap: () {
              print("works");
            },
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  AddressCard(
                    name: "Jane Doe",
                    address:
                        "S-101, Nillenium Park, Civil Line Los Santos California, USA, 400005",
                  )
                ],
              )),
          SizedBox(
            height: 300,
          ),
          Summary()
        ],
      ),
    );
  }
}
