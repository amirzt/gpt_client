import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/root/root_controller.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MyBottomNavigation extends GetWidget<RootController> {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: GlobalStrings.chat,
              icon: const ImageIcon(
                AssetImage('assets/icons/chat.png'),
                size: 28,
              )),
          BottomNavigationBarItem(
              label: GlobalStrings.task,
              icon: const ImageIcon(
                AssetImage('assets/icons/task.png'),
                size: 28,
              )),
          BottomNavigationBarItem(
              label: GlobalStrings.history,
              icon: const ImageIcon(
                AssetImage('assets/icons/history.png'),
                size: 28,
              )),
        ],
        iconSize: 28,
        currentIndex: controller.currentIndex.value,
        onTap: (int index) {
          controller.currentIndex.value = index;
          controller.pageController.animateToPage(index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutQuad);
        },
        backgroundColor: GlobalColors.secondBackgroundColor,
        selectedItemColor: GlobalColors.primaryColor,
        unselectedItemColor: GlobalColors.divider,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          color: GlobalColors.primaryColor
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          color: GlobalColors.divider
        ),
      );
    });
  }
}
