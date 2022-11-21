import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class CountDownTaskController extends GetxController{
  RxBool isVisiable = true.obs;
  RxBool isResume = false.obs;
  final CountDownController controller = CountDownController();
  final int duration = 100;



  void checkResume(){
     if(isResume.value){
      controller.pause();
      isResume.value = !isResume.value;
    }else{
      controller.resume();
      isResume.value = !isResume.value;
    }
  }
}