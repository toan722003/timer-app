import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/setting_controller.dart';
import 'package:timer_app/main.dart';

import '../../theme/color.dart';
import '../../theme/gradient.dart';

class SettingWidget extends StatefulWidget {
  SettingWidget({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  SettingController settingController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200.w,
        decoration: const BoxDecoration(
          gradient: MyGradient.linerGradient1,
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: UIColor.black),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                items: [
                  dropdownMenuItem("Viet Nam"),
                  dropdownMenuItem("English"),
                ],
                onChanged: (value) {
                  setState(() {
                    settingController.language = value!;
                    value == "Viet Nam"
                        ? context.setLocale(Locale('vi'))
                        : context.setLocale(Locale('en'));
                  });
                },
                value: settingController.language,
                icon: const Icon(Icons.language, color: UIColor.accentGreen),
                underline: Container(height: 0.h),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> dropdownMenuItem(String nameLanguage) {
    return DropdownMenuItem(
      value: nameLanguage,
      child: InkWell(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nameLanguage),
            ],
          ),
        ),
      ),
    );
  }
}
