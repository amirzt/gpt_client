import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/services/locale_services.dart';

class InputWidget extends GetWidget<ChatController> {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: GlobalColors.divider),
            child: Obx(() => TextFormField(
                  controller: controller.textEditingController,
                  style: TextStyle(
                    color: GlobalColors.whiteTextColor,
                  ),
                  textDirection: LocaleServices()
                      .detectTextDirection(controller.textValue.value),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      prefixIcon: controller.textValue.value.isEmpty
                          ? IconButton(
                              icon: Image.asset(
                                'assets/icons/scan.png',
                                color: GlobalColors.whiteTextColor,
                              ),
                              onPressed: () {},
                            )
                          : null,
                      hintText: GlobalStrings.typeMessageHere,
                      hintStyle: TextStyle(color: GlobalColors.whiteTextColor),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none),
                ))),
        const SizedBox(
          width: 10,
        ),
        Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: GlobalColors.greenTextColor),
            child: Obx(() => InkWell(
                  child: Image.asset(
                    controller.textValue.value.isEmpty
                        ? 'assets/icons/voice.png'
                        : 'assets/icons/camera.png',
                    color: GlobalColors.whiteTextColor,
                  ),
                  onTap: () {
                    if (controller.textValue.value.isNotEmpty) {
                      controller.addUserMessage();
                    }
                  },
                )))
      ],
    );
  }
}
