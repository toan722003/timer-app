import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timer_app/theme/textStyle.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TableCalendar(
                  focusedDay: addClockController.focusDay,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2040, 1, 1),
                  calendarFormat: addClockController.calendarFormat,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronPadding: EdgeInsets.all(8),
                    rightChevronPadding: EdgeInsets.all(8),
                    leftChevronMargin: EdgeInsets.symmetric(horizontal: 4),
                    rightChevronMargin: EdgeInsets.symmetric(horizontal: 4),
                  ),
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
                  // onFormatChanged: (format) {
                  //   print(format.name);
                  //   setState(() {
                  //     addClockController.calendarFormat  = format;
                  //   });
                  // },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttonSelectCalendarFormat("Month", CalendarFormat.month),
                  buttonSelectCalendarFormat("2 Weeks", CalendarFormat.twoWeeks),
                  buttonSelectCalendarFormat("Week", CalendarFormat.week),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 80.w,
                height: 40.h,
                decoration: BoxDecoration(
                    border: Border.all(color: UIColor.black),
                    color: UIColor.countDown_whiteAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Back",
                    style: UITextStyle.button_select_black_16_bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 80.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    color: UIColor.linear, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Apply",
                    style: UITextStyle.note_white_16_bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonSelectCalendarFormat(String nameCF, CalendarFormat calendarFormat) {
    return InkWell(
      onTap: () {
        setState(() {
          addClockController.calendarFormat = calendarFormat;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
              colors: [UIColor.createTask, UIColor.accentBlue, UIColor.task_yellowDark],
              end: Alignment.topRight,
              begin: Alignment.topLeft,
              stops: [0.1, 0.4, 0.6]),
        ),
        child: Text(nameCF, style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
