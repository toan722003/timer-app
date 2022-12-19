import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:timer_app/controller/home_menu_controller.dart';
import 'package:timer_app/extension/translate.dart';
import 'package:timer_app/theme/locale_keys.g.dart';

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
      backgroundColor: UIColor.white,
      body: TabBarView(
        children: homeMenuController.listScreen,
        controller: homeMenuController.tabController,
      ),
      bottomNavigationBar: Obx(() => SalomonBottomBar(
            onTap: homeMenuController.onTapChange,
            currentIndex: homeMenuController.currentIndex.value,
            selectedItemColor: UIColor.red,
            unselectedItemColor: UIColor.countDown_whiteAccent,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.clock_1),
                title: Text(LocaleKeys.tab_bar_clock.trans()),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.task_square),
                title: Text(LocaleKeys.tab_bar_task.trans()),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.note_1),
                title: Text(LocaleKeys.tab_bar_note.trans()),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.setting_2),
                title: Text(LocaleKeys.tab_bar_setting.trans()),
              ),
            ],
          )),
    );
  }
}
