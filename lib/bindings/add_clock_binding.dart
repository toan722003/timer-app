import 'package:get/get.dart';
import 'package:timer_app/controller/add_clock_controller.dart';

class AddClockBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddClockController>(AddClockController());
  }
}
