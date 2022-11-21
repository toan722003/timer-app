import 'package:get/get.dart';
import 'package:timer_app/controller/count_down_task%20_controller.dart';

class CountDownBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CountDownTaskController>(() => CountDownTaskController());
  }

}