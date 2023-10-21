import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/task/task_controller.dart';
import 'package:gpt/module/task/widgets/categories_widget.dart';
import 'package:gpt/module/task/widgets/task_item_widget.dart';

class Taskpage extends GetView<TaskController> {
  const Taskpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
            height: 60,
            child: Obx(() => controller.isCategoryLoading.value
                ? MyProgressIndicator(GlobalColors.whiteTextColor)
                : const CategoriesWidget())),
        Expanded(
          child: Obx(() => controller.isTaskLoading.value
              ? MyProgressIndicator(GlobalColors.whiteTextColor)
              : GridView.builder(
                  itemCount: controller.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width / (350),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return TaskItemWidget(controller.items[index]);
                  },
                )),
        )
      ],
    ));
  }
}
