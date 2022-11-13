import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_app/controller/clock_controller.dart';
import 'package:timer_app/theme/color.dart';
import 'package:timer_app/theme/textStyle.dart';
import 'package:timer_app/widget/clock/add_clock.dart';

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
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 4),
                //     blurRadius: 4,
                //     spreadRadius: 0,
                //   )
                // ]
              ),
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
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("resources/images/hand_point_right.png")),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: InkWell(
                          onTap: () {
                            print("next screen is edit clock");
                          },
                        ),
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
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: UIColor.accentWhite,
            border: Border.all(style: BorderStyle.solid, color: UIColor.black, width: 2),
            image: const DecorationImage(
              image: AssetImage("resources/images/images.png"),
            )),
        child: InkWell(
          onTap: () {
            Get.toNamed("/homemenu/addclock");
          },
        ),
      ),
    );
  }
}
