import 'package:get/get.dart';
import 'package:timer_app/controller/clock_controller.dart';

class ClockBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ClockController>(() => ClockController());
  }

}