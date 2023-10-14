
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/global/widgets/app_bar.dart';
import 'package:gpt/global/widgets/bottom_navigation.dart';
import 'package:gpt/module/root/root_controller.dart';

class RootPage extends GetView<RootController>{
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      bottomNavigationBar: const MyBottomNavigation(),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        );
      }),
    );
  }

}