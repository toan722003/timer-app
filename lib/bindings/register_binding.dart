import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:timer_app/controller/register_controller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterContrller>(() => RegisterContrller());
  }
}