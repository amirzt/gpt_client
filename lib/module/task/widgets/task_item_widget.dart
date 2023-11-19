import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/module/chat/chat_page.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;

  const TaskItemWidget(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: GlobalColors.secondBackgroundColor,
          // border: Border.all(color: GlobalColors.borderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    task.offline ? Image.asset(task.icon) : Image.network(task.icon),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      task.name,
                      style: TextStyle(
                          color: GlobalColors.greenTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      task.description,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: GlobalColors.whiteTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                )),
            onTap: (){
              Get.to(ChatPage(0, false,script: task.script,));
            },
          ),
        ),
      ),
    );
  }
}
