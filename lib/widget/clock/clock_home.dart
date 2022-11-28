import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/clock_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

class ClockHomeWidget extends StatefulWidget {
  const ClockHomeWidget({Key? key}) : super(key: key);

  @override
  State<ClockHomeWidget> createState() => _ClockHomeWidgetState();
}

class _ClockHomeWidgetState extends State<ClockHomeWidget> {
  ClockController clockController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      body: Container(
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: clockController.list.isEmpty
            ? nonHaveItem()
            : ListView.builder(
                itemCount: clockController.list.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 110.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
                    decoration: BoxDecoration(
                      color: UIColor.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: UIColor.black.withOpacity(0.25),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "4: 35 CH",
                                style: UITextStyle.item_clock_black_40_bold,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10.w),
                              width: 40.w,
                              height: 20.h,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: UIColor.accentGreen,
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("next screen is edit clock");
                                },
                                child: const Icon(Icons.navigate_next_outlined,color: UIColor.white,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                                child: Text(
                              "T2,T3,T4,T5",
                              style: UITextStyle.item_clock_black_15_bold,
                            )),
                            Switch(
                              value: clockController.isSwitch,
                              onChanged: (value) {
                                setState(() {
                                  clockController.isSwitch = value;
                                });
                              },
                              activeColor: UIColor.accentGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed("/homemenu/addclock");
        },
        child: Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: UIColor.accentGreen,
            border: Border.all(style: BorderStyle.solid, color: UIColor.white, width: 1),
          ),
          child: const Icon(
            Icons.add_circle,
            color: UIColor.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget nonHaveItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 350.h,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: Image(image: AssetImage("resources/images/non_clock.png")),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          child: Text(
            "You have no clock today!",
            style: UITextStyle.text_notifical_red_20_bold,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          alignment: Alignment.center,
          height: 20,
          child: Text(
            "Click the  (+)  icon to add a new clock",
            style: UITextStyle.taskbar_item_black_12_normal,
          ),
        ),
      ],
    );
  }
}
