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
      margin: EdgeInsets.all(20.h),
      child: Column(
        children: [
          Expanded(
            child: TableCalendar(
              focusedDay: addClockController.focusDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2040, 1, 1),
              calendarFormat: addClockController.calenderFormat[2],
              headerStyle: const HeaderStyle(
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
              onFormatChanged: (format) {

              },
            ),
          ),
          // SizedBox(
          //   height: 10.h,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 50.h,
                decoration: const BoxDecoration(
                    color: UIColor.btOnOff, borderRadius: BorderRadius.all(Radius.circular(10))),
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
}
