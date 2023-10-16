
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/home/home_controller.dart';
import 'package:gpt/module/home/widgets/middle_widget.dart';
import 'package:gpt/module/home/widgets/recommended_widget.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: GlobalColors.mainBackgroundColor,
      body: const Column(
        children: [
          HomeMiddleWidget(),
          Expanded(child: RecommendedWidget())
        ],
      )
    );
  }

}