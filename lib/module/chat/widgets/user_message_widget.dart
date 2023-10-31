import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/widgets/message_bottom_widget.dart';
import 'package:gpt/services/locale_services.dart';

class UserMessageWidget extends GetWidget<GetxController> {
  final Message message;

  const UserMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 60,
        right: 10,
        top: 10,
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                GlobalColors.bubbleGradientStart,
                GlobalColors.bubbleGradientEnd,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  message.content.value,
                  // textDirection: LocaleServices()
                  //     .detectTextDirection(message.content.value),
                  style: TextStyle(
                    color: GlobalColors.whiteTextColor,
                  ),
                ),),

                const SizedBox(height: 10,),
                MessageBottomWidget(message)
              ],
            ),
          )),
    );
  }
}
