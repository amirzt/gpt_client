
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/chat/widgets/chat_item_widget.dart';
import 'package:gpt/module/history/history_controller.dart';

class HistoryPage extends GetView<HistoryController>{
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    return Scaffold(
      body: Obx(() => controller.isLoading.value
       ? MyProgressIndicator(GlobalColors.whiteTextColor)
      : Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.conversations.length,
                  itemBuilder: (context, index){
                    return ChatItemWidget(controller.conversations[index]);
                  },
                ),
              )
            ],
          ))
      )
    );
  }

}