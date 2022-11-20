
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/add_clock_controller.dart';
import 'package:timer_app/controller/add_task_controllrer.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';

import '../clock/table_calender.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({Key? key}) : super(key: key);

  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  AddTaskController addTaskController = Get.find();
  AddClockController addClockController = Get.put(AddClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.white,
      appBar: AppBar(
        backgroundColor: UIColor.white,
        elevation: 0.0,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_left,
            color: UIColor.black,
            size: 50,
          ),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          "Create New Task",
          style: UITextStyle.newTask_black_24_bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          padding: EdgeInsets.only(top: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameOfLabel("Title"),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Task title",
                    hintStyle: UITextStyle.hide_text_accentWhite_12_normal,
                    contentPadding: EdgeInsets.only(left: 20.w),
                    // labelText: "Title",
                    // labelStyle: UITextStyle.textViewPeecent_black_18_bold.copyWith(fontSize: 23),
                    enabledBorder: onEnableBorder(),
                    focusedBorder: onFocusBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameOfLabel("Date"),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    context: context,
                                    backgroundColor: UIColor.white,
                                    builder: (context) {
                                      return SizedBox(height: 500.h, child: TableCalender());
                                    });
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Date",
                                hintStyle: UITextStyle.hide_text_accentWhite_12_normal,
                                contentPadding: EdgeInsets.only(left: 20.w),
                                enabledBorder: onEnableBorder(),
                                focusedBorder: onFocusBorder(),
                                suffixIcon: suffixIconTFF("resources/images/date_in_new_task.png"),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameOfLabel("Start Time"),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Start Time",
                                hintStyle: UITextStyle.hide_text_accentWhite_12_normal,
                                contentPadding: EdgeInsets.only(left: 20.w),
                                // labelText: "Title",
                                // labelStyle: UITextStyle.textViewPeecent_black_18_bold.copyWith(fontSize: 23),
                                enabledBorder: onEnableBorder(),
                                focusedBorder: onFocusBorder(),
                                suffixIcon: suffixIconTFF("resources/images/clock_in_new_task.png"),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 10.h),
              nameOfLabel("Category"),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Category",
                      hintStyle: UITextStyle.hide_text_accentWhite_12_normal,
                      contentPadding: EdgeInsets.only(left: 20.w),
                      // labelText: "Title",
                      // labelStyle: UITextStyle.textViewPeecent_black_18_bold.copyWith(fontSize: 23),
                      enabledBorder: onEnableBorder(),
                      focusedBorder: onFocusBorder(),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 50.sp,
                        color: UIColor.accentRed,
                      )),
                ),
              ),
              SizedBox(height: 10.h),
              nameOfLabel("Long Break"),
              Obx(() {
                return SizedBox(
                  height: 20.h,
                  child: Slider(
                      activeColor: UIColor.accentGreen,
                      inactiveColor: UIColor.accentWhite,
                      divisions: 10,
                      min: 0,
                      max: 180,
                      label: "${addTaskController.countLongBreak.value.toInt()}",
                      thumbColor: UIColor.accentRed,
                      value: addTaskController.countLongBreak.value,
                      onChanged: (value) {
                        addTaskController.countLongBreak.value = value;
                      }),
                );
              }),
              SizedBox(height: 10.h),
              nameOfLabel("Short Break"),
              Obx(() {
                return Container(
                  width: 400.w,
                  height: 20.h,
                  child: Slider(
                      activeColor: UIColor.accentGreen,
                      inactiveColor: UIColor.accentWhite,
                      divisions: 5,
                      min: 0,
                      max: 30,
                      label: "${addTaskController.countShortBreak.value.toInt()}",
                      thumbColor: UIColor.accentRed,
                      value: addTaskController.countShortBreak.value,
                      onChanged: (value) {
                        addTaskController.countShortBreak.value = value;
                      }),
                );
              }),
              SizedBox(height: 80.h),
              Container(
                alignment: Alignment.center,
                height: 50.h,
                decoration: const BoxDecoration(
                  color: UIColor.createTask,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Create New Task",
                    style: UITextStyle.button_newTask_white_20_bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameOfLabel(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: UITextStyle.textViewPeecent_black_18_bold.copyWith(fontSize: 20),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  OutlineInputBorder onEnableBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: UIColor.accentRed),
    );
  }

  OutlineInputBorder onFocusBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: UIColor.accentGreen),
    );
  }

  Widget suffixIconTFF(String imageAddress) {
    return Container(
      width: 30.w,
      height: 30.h,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAddress),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
