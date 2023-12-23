import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/module/chat/widgets/input_widget.dart';
import 'package:gpt/module/home/home_controller.dart';
class RecommendedItem extends StatelessWidget {
  final Task task;

  const RecommendedItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: GlobalColors.secondBackgroundColor,
          // border: Border.all(color: GlobalColors.borderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(task.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.whiteTextColor,
                      fontSize: 16
                  ),),),
                const SizedBox(width: 10,),
                // const Spacer(),
                Image.asset(task.icon)
              ],
            ),
            onTap: (){
              Get.to(ChatPage(0,true ,script: task.script,));
            },
          ),
        ),
      ),
    );
  }
}
