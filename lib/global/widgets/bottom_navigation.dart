
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/root/root_controller.dart';

class MyBottomNavigation extends GetWidget<RootController>{
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.currentIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: tr(GlobalStrings.chat),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: tr(GlobalStrings.task),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: tr(GlobalStrings.history),
          ),
        ],
      );
    });
  }

}