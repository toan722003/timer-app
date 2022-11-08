import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timer_app/theme/color.dart';

Future main() async {
  await initialization();
  runApp(const MyApp());
}

Future initialization() async {
  splashScreen();
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        backgroundColor: UIColor.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

Widget splashScreen() {
  return Stack(
    children: [
      Image.asset(
        "resources/images/splashscreen.png",
        width: Get.width,
        height: Get.height,
      ),
      Positioned(
          top: 500,
          left: 200,
          child: Container(
            color: UIColor.white,
            width: 100,
            height: 100,
          )),
    ],
  );
}
