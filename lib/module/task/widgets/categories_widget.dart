import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/home/home_controller.dart';
import 'package:gpt/module/task/task_controller.dart';

class CategoriesWidget extends GetWidget<TaskController> {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Container(
                // height: 30,
                decoration: BoxDecoration(
                    gradient: controller.selectedIndex.value == index
                        ? LinearGradient(
                      colors: [
                        GlobalColors.bubbleGradientStart,
                        GlobalColors.bubbleGradientEnd,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                        : LinearGradient(
                      colors: [
                        GlobalColors.secondBackgroundColor,
                        GlobalColors.secondBackgroundColor,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(controller.categories[index].name,
                      style: TextStyle(
                          color: GlobalColors.whiteTextColor
                      ),),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
