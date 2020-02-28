import 'package:flutter/material.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatefulWidget {
  bool editable;
  Map<DateTime, List<dynamic>> selected;
  
  Calendar({this.editable, this.selected});
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    widget.selected = {
      DateTime(2019, 12, 14) : [],
      DateTime(2019, 12, 15) : [],
      DateTime(2019, 12, 16) : [],
      DateTime(2019, 12, 17) : [],

    };
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: !widget.editable,
        child: TableCalendar(
          holidays: widget.selected,
          availableGestures: AvailableGestures.horizontalSwipe,
          builders: CalendarBuilders(holidayDayBuilder: (context, day, list) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kossetPurpleFromThePallet,
                    borderRadius: BorderRadius.circular(50)
                    ),
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
        ));
  }
}