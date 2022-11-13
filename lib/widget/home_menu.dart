import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timer_app/controller/home_menu_controller.dart';
import 'package:get/get.dart';

import '../theme/color.dart';

class HomeMenuWidget extends StatefulWidget {
  const HomeMenuWidget({Key? key}) : super(key: key);

  @override
  State<HomeMenuWidget> createState() => _HomeMenuWidgetState();
}

class _HomeMenuWidgetState extends State<HomeMenuWidget> with TickerProviderStateMixin {
  HomeMenuController homeMenuController = Get.find();

  @override
  void initState() {
    super.initState();
    homeMenuController.tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: homeMenuController.listScreen,
        controller: homeMenuController.tabController,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          selectedItemColor: UIColor.black,
          unselectedItemColor: UIColor.accentGrey,
          onTap: homeMenuController.onTapChange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.clock_1),
              label: "Clock",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.task_square),
              label: "Task",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.note_1),
              label: "Note",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting_2),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }
}
