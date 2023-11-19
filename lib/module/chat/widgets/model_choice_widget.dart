import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/settings/settings_controller.dart';
import 'package:gpt/module/shop/plans/shop_page.dart';

class ModelChoiceWidget extends GetWidget<ChatController> {
  const ModelChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: GlobalColors.secondBackgroundColor),
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
                        if(controller.isExpired.value){
                          Get.snackbar(
                              'upgrade', 'upgrade to use gpt4',
                          colorText: GlobalColors.whiteTextColor,
                          mainButton: TextButton(
                              onPressed: (){
                                Get.put(SettingsController());
                                Get.to(const ShopPage());
                              },
                              child: Text(GlobalStrings.upgrade,
                              style: TextStyle(
                                color: GlobalColors.bubbleGradientStart,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),).tr()
                          ));
                        }else{
                          controller.gptModel.value = 'GPT4';
                        }
                      },
                      child: Center(
                        child: Obx(() => controller.isExpired.value
                         ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'GPT4',
                              style: TextStyle(
                                  color: GlobalColors.whiteTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
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
