
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController>{
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: GlobalColors.mainBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Center(
          //   child: DefaultTextStyle(
          //     style: TextStyle(
          //       fontSize: 18,
          //       color: GlobalColors.whiteTextColor
          //     ),
          //     // child: AnimatedTextKit(
          //     //   onFinished: (){
          //     //     controller.getUserInfo();
          //     //     // navigationPage();
          //     //   },
          //     //   isRepeatingAnimation: true,
          //     //   repeatForever: false,
          //     //   totalRepeatCount: 2,
          //     //   animatedTexts: [
          //     //     TypewriterAnimatedText(
          //     //         GlobalStrings.appName,
          //     //         speed: const Duration(milliseconds: 100),
          //     //         textStyle: TextStyle(color: GlobalColors.white),
          //     //         cursor: '')
          //     //   ],
          //     // ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: MyProgressIndicator(GlobalColors.whiteTextColor),
            ),
          )
        ],
      )
    );
  }

}