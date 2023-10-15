
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/history/history_controller.dart';

class HistoryPage extends GetView<HistoryController>{
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    return Scaffold(
      body: Center(
        child: Text('test man chi'),
      ),
    );
  }

}