import 'package:get/get.dart';

class AddTaskController extends GetxController{
  RxDouble countLongBreak = 0.0.obs;
  RxDouble countShortBreak = 0.0.obs;
  List<String> suggestons = ["USA", "UK", "Uganda", "Uruguay", "United Arab Emirates"];
}