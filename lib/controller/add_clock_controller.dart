import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AddClockController extends GetxController{
  DateTime focusDay =  DateTime.now() ;
  DateTime? selectDay ;
  List<CalendarFormat> calenderFormat = [CalendarFormat.month,CalendarFormat.twoWeeks,CalendarFormat.week] ;
  RxBool isSelect = false.obs;
}