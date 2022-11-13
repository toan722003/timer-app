import 'package:get/get.dart';
import 'package:timer_app/controller/note_controller.dart';

class NoteBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(() => NoteController());
  }

}