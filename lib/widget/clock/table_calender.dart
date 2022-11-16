import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controller/add_clock_controller.dart';
import '../../theme/color.dart';

class TableCalender extends StatefulWidget {
  const TableCalender({Key? key}) : super(key: key);

  @override
  _TableCalenderState createState() => _TableCalenderState();
}

class _TableCalenderState extends State<TableCalender> {
  AddClockController addClockController = Get.find();

  @override
  Widget build(BuildContext context) {
    return tableCalender();
  }

  Widget tableCalender() {
    return TableCalendar(
      focusedDay: addClockController.focusDay,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2040, 1, 1),
      calendarFormat: addClockController.calenderFormat,
      selectedDayPredicate: (day) {
        return isSameDay(addClockController.selectDay, day);
      },
      onDaySelected: (focusDay, selectDay) {
        if (!isSameDay(addClockController.selectDay, selectDay)) {
          setState(() {
            addClockController.focusDay = focusDay;
            addClockController.selectDay = selectDay;
          });
        }
      },
      onPageChanged: (focusDay) {
        addClockController.focusDay = focusDay;
      },
      onFormatChanged: (format){
        addClockController.calenderFormat = format;
        print(format.toString());
      },
    );
  }
}
