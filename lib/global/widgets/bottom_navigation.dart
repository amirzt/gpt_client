import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/history/history_controller.dart';
import 'package:gpt/module/root/root_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MyBottomNavigation extends GetWidget<RootController> {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // AnimationController historyAnimationController = AnimationController(vsync: this);
    return Obx(() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: tr(GlobalStrings.chat),
              icon: const ImageIcon(
                AssetImage('assets/icons/chat.png'),
                size: 24,
              )
          ),
          BottomNavigationBarItem(
              label: tr(GlobalStrings.task),
              icon: const ImageIcon(
                AssetImage('assets/icons/task.png'),
                size: 24,
              )),
          // BottomNavigationBarItem(
          //     label: GlobalStrings.history,
          //     icon: Lottie.asset(
          //         'assets/animations/history.json',
          //       controller: controller.animationController,
          //       width: 30,
          //       height: 30
          //     ),
          // ),
          BottomNavigationBarItem(
              label: tr(GlobalStrings.history),
              icon: const ImageIcon(
                AssetImage('assets/icons/history.png'),
                size: 24,
              )),
        ],
        iconSize: 24,
        currentIndex: controller.currentIndex.value,
        onTap: (int index) {
          controller.currentIndex.value = index;
          controller.pageController.animateToPage(index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutQuad);
          if(index == 2){
            HistoryController historyController = Get.put(HistoryController());
            historyController.getConversations();
          }
          // controller.animationController.forward();
        },
        backgroundColor: GlobalColors.secondBackgroundColor,
        selectedItemColor: GlobalColors.selected,
        unselectedItemColor: GlobalColors.unSelected,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          color: GlobalColors.selected
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          color: GlobalColors.unSelected
        ),
      );
    });
  }
}
