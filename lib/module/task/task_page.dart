
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/task/task_controller.dart';

class Taskpage extends GetView<TaskController>{
  const Taskpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());
    return Scaffold(
      body: Center(
        child: Text('test 2 '),
      ),
    );
  }

}