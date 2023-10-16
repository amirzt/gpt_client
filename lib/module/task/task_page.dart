
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/task/task_controller.dart';
import 'package:gpt/module/task/widgets/categories_widget.dart';
import 'package:gpt/module/task/widgets/task_item_widget.dart';

class Taskpage extends GetView<TaskController>{
  const Taskpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
              child: CategoriesWidget()),
          Expanded(
            child: GridView.builder(
              itemCount: controller.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width / (350),

                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
              ),
                itemBuilder: (context, index){
                return TaskItemWidget(controller.items[index]);
                },

            ),
          )
        ],
      )
    );
  }

}