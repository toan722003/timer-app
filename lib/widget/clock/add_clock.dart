import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/add_clock_controller.dart';
import 'package:timer_app/extension/translate.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/gradient.dart';
import 'package:timer_app/theme/locale_keys.g.dart';
import 'package:timer_app/theme/textStyle.dart';
import 'package:timer_app/widget/clock/futureAddClock.dart';
import 'package:timer_app/widget/clock/table_calender.dart';

class AddClockWidget extends StatefulWidget {
  const AddClockWidget({Key? key}) : super(key: key);

  @override
  _AddClockWidgetState createState() => _AddClockWidgetState();
}

class _AddClockWidgetState extends State<AddClockWidget> {
  AddClockController addClockController = Get.find();

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130.w,
        backgroundColor: UIColor.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: UIColor.task_redWhite,
            ),
            child: const Icon(
              Icons.backspace_rounded,
              color: UIColor.white,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              print("${dateTime.hour} : ${dateTime.minute}");
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              margin: EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: UIColor.accentGreen,
              ),
              child: const Icon(
                Icons.done_all_outlined,
                color: UIColor.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        color: UIColor.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 250.h,
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: MyGradient.linerGradient1,
                shape: BoxShape.circle,
                border: Border.all(color: UIColor.accentBlue, style: BorderStyle.solid, width: 4),
              ),
              child: TimePickerSpinner(
                alignment: Alignment.center,
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 22.sp, color: UIColor.black),
                highlightedTextStyle: TextStyle(fontSize: 30.sp, color: UIColor.black),
                spacing: 40.w,
                itemHeight: 50.h,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    dateTime = time;
                  });
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 2.w),
              height: 40.h,
              child: ListView.separated(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Obx(() => Container(
                        alignment: Alignment.center,
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: addClockController.isSelect.isFalse
                              ? UIColor.countDown_whiteAccent
                              : UIColor.accentGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: UIColor.black),
                        ),
                        child: InkWell(
                          child: Text(
                            index == 6 ? "CN" : "T${index + 2}",
                            style: UITextStyle.day_white_13_bold.copyWith(color: UIColor.black),
                          ),
                          onTap: () {
                            addClockController.isSelect.value = !addClockController.isSelect.value;
                          },
                        ),
                      ));
                },
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 12.w,
                  );
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureAddClock(
                  nameFuture: LocaleKeys.clock_vibrate.trans(),
                  iconData: Icons.vibration_outlined,
                  color: UIColor.task_greenAccent,
                ),
                Obx(
                  () => InkResponse(
                    onTap: () {
                      addClockController.isSelect.value = !addClockController.isSelect.value;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: addClockController.isSelect.isFalse
                            ? UIColor.countDown_whiteAccent
                            : UIColor.accentGreen,
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColor.black, style: BorderStyle.solid),
                      ),
                      width: 30,
                      height: 30,
                      child: addClockController.isSelect.isFalse
                          ? Container()
                          : const Icon(Icons.done, color: UIColor.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    ),
                    context: context,
                    backgroundColor: null,
                    builder: (context) {
                      return Container(height: 500.h, child: TableCalender());
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureAddClock(
                    nameFuture: LocaleKeys.clock_alarm_appointment.trans(),
                    iconData: Icons.calendar_month_rounded,
                    color: UIColor.task_yellowDark,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: UIColor.countDown_whiteAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColor.black, style: BorderStyle.solid)),
                    width: 30,
                    height: 30,
                    child: const Icon(Icons.add, color: UIColor.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            InkResponse(
              focusColor: UIColor.accentGreen,
              hoverColor: UIColor.accentGreen,
              highlightColor: UIColor.accentGreen,
              onTap: () {
                print("Nhac chuong");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureAddClock(
                    nameFuture: LocaleKeys.clock_ring.trans(),
                    iconData: Icons.ring_volume_rounded,
                    color: UIColor.task_redWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
