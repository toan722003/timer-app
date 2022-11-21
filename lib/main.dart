import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/bindings/add_clock_binding.dart';
import 'package:timer_app/bindings/add_task_binding.dart';
import 'package:timer_app/bindings/clock_binding.dart';
import 'package:timer_app/bindings/count_down_binding.dart';
import 'package:timer_app/bindings/home_menu_binding.dart';
import 'package:timer_app/bindings/note_binding.dart';
import 'package:timer_app/bindings/setting_binding.dart';
import 'package:timer_app/bindings/task_binding.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/widget/clock/add_clock.dart';
import 'package:timer_app/widget/clock/clock_home.dart';
import 'package:timer_app/widget/home_menu.dart';
import 'package:timer_app/widget/note/note_home.dart';
import 'package:timer_app/widget/setting/setting.dart';
import 'package:timer_app/widget/splashscreen.dart';
import 'package:timer_app/widget/task/add_task.dart';
import 'package:timer_app/widget/task/countdown_task.dart';
import 'package:timer_app/widget/task/task_home.dart';

Future main() async {
  // initializeDateFormatting().then((_) =>
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // BoxConstraints(
      //     maxWidth: MediaQuery.of(context).size.width,
      //     maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            backgroundColor: UIColor.white,
          ),
          home: SplashScreen(),
          getPages: [
            GetPage(name: "/clockhome", page: () => ClockHomeWidget(), binding: ClockBinding()),
            GetPage(name: "/taskhome", page: () => TaskHomeWidget(), binding: TaskBinding()),
            GetPage(name: "/homemenu", page: () => HomeMenuWidget(), binding: HomeMenuBinding()),
            GetPage(name: "/notehome", page: () => NoteHomeWidget(), binding: NoteBinding()),
            GetPage(name: "/setting", page: () => SettingWidget(), binding: SettingBinDing()),
            GetPage(
                name: "/homemenu/addclock",
                page: () => AddClockWidget(),
                binding: AddClockBinding()),
            GetPage(name: "/task/addtask", page: () => AddTaskWidget(), binding: AddTaskBinding()),
            GetPage(name: "/countdown", page: () => CountDownTask(), binding: CountDownBinding()),
          ],
        );
      },
    );
  }
}
