import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_app/controller/clock_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Container(
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: UIColor.white,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: 110,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                  color: UIColor.btOnOff,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "4: 35 CH",
                          style: UITextStyle.item_clock_black_40_bold,
                        ),
                      ),
                      InkWell(
                        child: Image.asset("resources/images/hand_point_right.png",width: 50,height: 50,),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
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
                        activeTrackColor: UIColor.accentGreen,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UIColor.green,
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
  }
}
