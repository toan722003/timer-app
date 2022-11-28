import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClockController extends GetxController {
  DateTime focusDay = DateTime.now();
  DateTime? selectDay;
  RxBool isSelect = false.obs;
  CalendarFormat calendarFormat = CalendarFormat.month;
}
