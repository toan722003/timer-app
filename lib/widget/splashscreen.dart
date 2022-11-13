import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:timer_app/theme/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed("/homemenu");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            child: Image.asset(
              "resources/images/splashscreen.png",
              fit: BoxFit.cover,
              height: Get.height,
              width: Get.width,
            ),
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: Get.height * (3 / 4)),
            child: LoadingAnimationWidget.threeRotatingDots(color: UIColor.white, size: 50),
          ),
        ),
      ],
    );
  }
}
