import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/period/number_of_days.dart';
import 'package:table_calendar/table_calendar.dart';

class LastPeriod extends StatefulWidget {
  @override
  _LastPeriodState createState() => _LastPeriodState();
}

class _LastPeriodState extends State<LastPeriod> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(child: Image.asset("assets/e.png")),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Answer some questions to\n get started.",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: kossetPurpleFromThePallet,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          height: 35,
                          width: 35,
                          child: Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "When did you have your\n",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "last Period?",
                                  style: TextStyle(fontSize: 18))
                            ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color.fromARGB(20, 0, 0, 0),
                              color: Colors.white,
                              border: Border.all(color: kossetDarkPink),
                              borderRadius: BorderRadius.circular(15)),
                          child: TableCalendar(
                            availableGestures:
                                AvailableGestures.horizontalSwipe,
                            builders: CalendarBuilders(
                                holidayDayBuilder: (context, day, list) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kossetPurpleFromThePallet,
                                      borderRadius: BorderRadius.circular(50)),
                                  alignment: Alignment.center,
                                  child: Text(day.day.toString()),
                                ),
                              );
                            }),
                            calendarStyle: CalendarStyle(
                                selectedColor: kossetLightPink,
                                holidayStyle: TextStyle(
                                  backgroundColor: kossetPurpleFromThePallet,
                                ),
                                weekendStyle: TextStyle(color: Colors.red)),
                            calendarController: _calendarController,
                          ),
                        )),
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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => NumberOfDays()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
