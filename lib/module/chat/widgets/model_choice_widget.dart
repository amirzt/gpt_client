import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class ModelChoiceWidget extends GetWidget<ChatController> {
  const ModelChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: GlobalColors.divider),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: controller.gptModel.value == 'GPT-turbo'
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: GlobalColors.primaryColor)
                        : const BoxDecoration(),
                    child: InkWell(
                      onTap: () {
                        controller.gptModel.value = 'GPT-turbo';
                      },
                      child: Center(
                        child: Text(
                          'GPT-turbo',
                          style: TextStyle(
                              color: GlobalColors.whiteTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: controller.gptModel.value == 'GPT4'
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: GlobalColors.primaryColor)
                        : const BoxDecoration(),
                    child: InkWell(
                      onTap: () {
                        controller.gptModel.value = 'GPT4';
                      },
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset('assets/icons/lock.png'),
                            const SizedBox(width: 10,),
                            Text(
                              'GPT4',
                              style: TextStyle(
                                  color: GlobalColors.whiteTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
