import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kosset_closet/api/firestoreService.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/constants/misc.dart';
import 'package:kosset_closet/screens/store/home.dart';
import 'package:table_calendar/table_calendar.dart';

class BirthDate extends StatefulWidget {
  @override
  _BirthDateState createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
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

  DateTime _now = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _now,
        firstDate: DateTime(1960),
        lastDate: DateTime(2100));
    if (picked != null && picked != _now) {
      setState(() {
        _now = picked;
        print(_now.toString());
      });
    }
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
                            "3",
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
                                  text: "When were you ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "born?", style: TextStyle(fontSize: 18))
                            ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(20, 0, 0, 0),
                            border: Border.all(color: kossetDarkPink),
                            borderRadius: BorderRadius.circular(15)),
                        child: FlatButtonDefault(
                          child: Text("CLICK TO ENTER DATE OF BIRTH"),
                          onPressed: () {
                            selectDate(context);
                          },
                        ),
                      ),
                    ),
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
                      onTap: () {
                        print("I don't remember");
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: FlatButtonDefault(
              child: Text(
                "NEXT",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              buttonColor: kossetDefaultButton,
              onPressed: () async {
                final Box<dynamic> box = await Hive.openBox("user");
                box.put("birth_date", _calendarController.selectedDay);
                final Box<dynamic> settingBox = await Hive.openBox("settings");
                settingBox.put("isLoggedIn", true);

                await FirestoreService(uid: box.get('uid')).createUser(box);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Home()));
              },
            ),
          ),
        ),
      ],
    ));
  }
}
