import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:kosset_closet/screens/store/misc_widgets/expected.dart';
import 'package:kosset_closet/screens/store/misc_widgets/sub_status.dart';
import 'package:table_calendar/table_calendar.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(child: Text("Period Tracker", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: kossetDarkPink),
                    borderRadius: BorderRadius.circular(30)),
                child: TableCalendar(calendarController: _calendarController)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: Container(
              child: expectedPeriod(
                  DateTime(2019, 12, 3), DateTime.now(), context),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: Container(
              child: expectedFertile(
                  DateTime(2019, 12, 3), DateTime.now(), context),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: subscriptionStatus(context,
                      isSubscribed: true,
                      delivery: DateTime.now(),
                      color: kossetPurpleFromThePallet),
                ),
                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: kossetPurpleFromThePallet,
                  child: Icon(Icons.edit),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
