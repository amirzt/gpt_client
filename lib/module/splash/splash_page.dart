// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final Animation<double> animation = CurvedAnimation(
      parent: controller.animationController,
      curve: Curves.easeIn,
    );

    return Scaffold(
        backgroundColor: GlobalColors.mainBackgroundColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/splash_background.png'),
              // Replace 'assets/background_image.jpg' with your image file
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.center,
                child: FadeTransition(
                  opacity: animation,
                  child: Image.asset(
                      'assets/icons/ic_launcher.png',
                  width: 120,
                  height: 120,), // Replace with your item widget
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FadeTransition(
                  opacity: animation,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 180
                    ),
                    child: Text(
                      GlobalStrings.appName,
                      style: TextStyle(color: GlobalColors.whiteTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                    ),
                  ), // Replace with your item widget
                ),
              ),
              AnimatedPositioned(
                bottom: controller.isBottomVisible.value ? 0 : -100,
                  left: 0,
                  right: 0,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset('assets/icons/gpt.png'),
                  ))
            ],
          ),
        ));
  }
}
