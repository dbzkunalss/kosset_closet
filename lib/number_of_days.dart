import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'constants/color.dart';

class NumberOfDays extends StatefulWidget {
  @override
  _NumberOfDaysState createState() => _NumberOfDaysState();
}

class _NumberOfDaysState extends State<NumberOfDays> {
  int _currentIntValue = 5;

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
            bottom: -1,
            right: -1,
            child: Image.asset("assets/Ellipse3.png"),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: 14,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
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
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24),
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
                                      "2",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "How many days",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "did you have your period?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 80, bottom: 30, left: 30, right: 30),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  child: NumberPicker.integer(
                                      initialValue: _currentIntValue,
                                      minValue: 1,
                                      maxValue: 30,
                                      onChanged: (number) {
                                        setState(() {
                                          _currentIntValue = number;
                                        });
                                      }),
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
                          print("you gay");
                          print(_currentIntValue);
                        },
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
