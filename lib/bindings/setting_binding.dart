import 'package:get/get.dart';
import 'package:timer_app/controller/setting_controller.dart';

class SettingBinDing implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}