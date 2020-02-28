import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/period/when_born.dart';
import 'package:numberpicker/numberpicker.dart';

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
            child: Image.asset("assets/e.png", scale: 2,),
          ),
          Positioned(
            bottom: -1,
            right: -1,
            child: Image.asset("assets/Ellipse3.png", scale: 2,),
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
                                        color: kossetPurpleFromThePallet,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                 Center(
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE57485),
                                borderRadius: BorderRadius.circular(10)),
                            height: 21,
                            width: 26,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("I don't remember")
                        ],
                      ),
                      onTap: (){
                        print("I don't remember");
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BirthDate()));
                      },
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
