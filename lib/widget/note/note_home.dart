import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_app/theme/gradient.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

DateTime get getNow => DateTime.now();

class NoteHomeWidget extends StatefulWidget {
  NoteHomeWidget({Key? key}) : super(key: key);

  @override
  State<NoteHomeWidget> createState() => _NoteHomeWidgetState();
}

class _NoteHomeWidgetState extends State<NoteHomeWidget> {
  final List<CalendarEventData<Event>> _events = [
    CalendarEventData(
        title: "1",
        date: DateTime(2022, 11, 23, 1, 30),
        startTime: DateTime(2022, 11, 23, 1, 30),
        endTime: DateTime(2022, 11, 23, 2, 30),
        endDate: DateTime(2022, 11, 23, 1, 30),
        event: Event(title: "quite")),
    CalendarEventData(
        title: "2",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 3, 30),
        endTime: DateTime(2022, 11, 23, 4, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite1")),
    CalendarEventData(
        title: "2",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 6, 30),
        endTime: DateTime(2022, 11, 23, 7, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite2")),
    CalendarEventData(
        title: "3",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 12, 30),
        endTime: DateTime(2022, 11, 23, 13, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite3")),
    CalendarEventData(
        title: "4",
        date: getNow,
        startTime: DateTime(2022, 11, 23, 18, 30),
        endTime: DateTime(2022, 11, 23, 20, 30),
        endDate: getNow.subtract(const Duration(days: 1)),
        event: Event(title: "quite4")),
  ];

  @override
  Widget build(BuildContext context) {
    EventController<Event> controller = EventController();
    return CalendarControllerProvider(
        controller: controller,
        child: Scaffold(
          body: Container(
            // padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.only(top: 150.h),
            child: DayView(
              // design tab bar select day
              headerStyle: HeaderStyle(
                  headerTextStyle: UITextStyle.textViewPeecent_black_18_bold.copyWith(fontSize: 16),
                  leftIcon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColor.black),
                        color: UIColor.accentBlue),
                    child: const Icon(Icons.chevron_left, color: UIColor.white),
                  ),
                  rightIcon: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColor.black),
                        color: UIColor.accentBlue),
                    child: const Icon(Icons.chevron_right, color: UIColor.white),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                    gradient: MyGradient.linerGradient0,
                  )),
              hourIndicatorSettings: const HourIndicatorSettings(
                color: UIColor.countDown_whiteAccent,
              ),
              timeLineWidth: 60.w,
              timeLineBuilder: (date) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  alignment: Alignment.center,
                  child: Text(
                    "${date.hour} ${date.hour > 12 ? "PM" : "AM"}",
                    style: UITextStyle.button_select_black_16_bold.copyWith(fontSize: 14),
                  ),
                );
              },
              controller: controller..addAll(_events),
              eventTileBuilder: (date, events, rect, start, end) {
                CalendarEventData calendarEventData = events.elementAt(0);
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  height: 30,
                  decoration: const BoxDecoration(
                    color: UIColor.accentRed,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          calendarEventData.title,
                          style: UITextStyle.note_white_16_bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "$start",
                          style: UITextStyle.note_white_12_normal,
                        ),
                      )
                    ],
                  ),
                );
              },
              showVerticalLine: true,
              showLiveTimeLineInAllDays: false,
              minDay: DateTime(2020),
              maxDay: DateTime(2023),
              initialDay: DateTime.now(),
              heightPerMinute: 1.2,
              eventArranger: const SideEventArranger(),
              onEventTap: (events, date) {
                print(events.elementAt(0).startTime);
              },
              onDateLongPress: (date) => {},
            ),
          ),
        ));
  }
}

class Event {
  String title;

  Event({required this.title});
}
