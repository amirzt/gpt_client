import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/app_bar.dart';
import 'package:gpt/global/widgets/bottom_navigation.dart';
import 'package:gpt/global/widgets/home_app_bar.dart';
import 'package:gpt/module/root/root_controller.dart';
import 'package:gpt/module/splash/splash_page.dart';
import 'dart:ui' as ui;
class RootPage extends GetView<RootController> {
  final bool isSuccess;
  const RootPage(this.isSuccess, {super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(RootController());
    showInitialDialog();
    return SafeArea(
        child: Scaffold(
            backgroundColor: GlobalColors.mainBackgroundColor,
            appBar: const HomeAppBar(),
            bottomNavigationBar: const MyBottomNavigation(),
            body: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.pages,
            ))
    );
  }

  void showInitialDialog() async{
    if(!isSuccess){
      await Future.delayed(const Duration(seconds: 1), () {
        Get.dialog(
            AlertDialog(
              title: Text(GlobalStrings.connectionError,
                  style: TextStyle(color: GlobalColors.whiteTextColor)).tr(),
              content: Text(GlobalStrings.connectionErrorMessage,
                  style: TextStyle(color: GlobalColors.whiteTextColor)).tr(),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.off(const SplashPage());
                  },
                  child: Text(GlobalStrings.retry,
                    style: TextStyle(color: GlobalColors.whiteTextColor),).tr(),
                ),
              ],
            )
        );
      });
    }
  }

}
