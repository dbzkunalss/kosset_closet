import 'package:flutter/material.dart';
import 'package:kosset_closet/screens/store/misc_widgets/product.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Product(
            additional: "+ FREE HERBAL PERIOD CRAMPS RELIEF ROLL ON",
            shortDesc: "15 Sanitary Pads with Individual Disposal Packets",
            longDesc:
                "You can choose to buy the Standard Box OR Choose between the 3 sizes to create your Custom Box of 15 pads ",
            name: "KOSSET BOX",
            head: "Standard Box",
            mods: {
              "Heavy Flow and Overnight Pads (L)": 6,
              "Light and Medium Flow Pads (M)": 7,
              "Panty Liners for light spotting and discharge": 2
            },
            isStatic: false,
          ),
          Product(
            shortDesc: "3 Sanitary Pads with Individual Disposal Packets",
            name: "TRIAL BOX",
            mods: {
              "Heavy Flow and Overnight Pads (L)": 6,
              "Light and Medium Flow Pads (M)": 7,
              "Panty Liners for light spotting and discharge": 2
            },
            isStatic: true,
          )
        ],
      ),
    );
  }
}
