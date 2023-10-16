import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/global/widgets/app_bar.dart';
import 'package:gpt/global/widgets/bottom_navigation.dart';
import 'package:gpt/module/root/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: GlobalColors.mainBackgroundColor,
            appBar: const GlobalAppBar(),
            bottomNavigationBar: const MyBottomNavigation(),
            body: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.pages,
            )));
  }
}
