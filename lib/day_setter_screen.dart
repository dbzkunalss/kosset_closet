import 'package:flutter/material.dart';
import 'package:kosset_closet/calendar.dart';
import 'package:kosset_closet/number_of_days.dart';

import 'constants/color.dart';

class DaySetterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: -1,
            left: -1,
            child: Image.asset("assets/e.png"),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: 14,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 50),
                              child: Text(
                                "Answer some questions to\nget started",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 24),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: purpleFromThePallet,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "When did you have your",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "last Period?",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color.fromARGB(255, 239, 104, 133)),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Calendar(
                                editable: true,
                                selected: {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      backgroundColor: pinkColorShadow,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text("I don't remember"),
                      elevation: 0,
                      icon: Icon(Icons.help),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NumberOfDays()));
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NumberOfDays()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/arrow.png')),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
