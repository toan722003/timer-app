import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';
import '../../theme/textStyle.dart';

class CountDownTask extends StatelessWidget {
  CountDownTask({Key? key}) : super(key: key);
  final CountDownController _controller = CountDownController();
  final int _duration = 10;

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
          "Today Tasks (10)",
          style: UITextStyle.newTask_black_24_bold,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: CircularCountDownTimer(
          duration: 1000,
          initialDuration: 0,
          controller: _controller,
          width: 300.w,
          height: 300.h,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.purpleAccent[100]!,
          fillGradient: null,
          backgroundColor: Colors.purple[500],
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: UITextStyle.time_black_70_bold,
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: true,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
          // onChange: (String timeStamp) {
          //   debugPrint('Countdown Changed $timeStamp');
          // },
          // timeFormatterFunction: (defaultFormatterFunction, duration) {
          //   if (duration.inSeconds == 0) {
          //     return "Start";
          //   } else {
          //     return Function.apply(defaultFormatterFunction, [duration]);
          //   }
          // },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          _button(
            title: "Start",
            onPressed: () => _controller.start(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Pause",
            onPressed: () => _controller.pause(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Resume",
            onPressed: () => _controller.resume(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Restart",
            onPressed: () => _controller.restart(duration: _duration),
          ),
        ],
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
