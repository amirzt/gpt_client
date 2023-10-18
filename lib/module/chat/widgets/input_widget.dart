import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class InputWidget extends GetWidget<ChatController> {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: GlobalColors.divider),
          child: Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Image.asset(
                      'assets/scan.png',
                    color: GlobalColors.divider,
                  ),
                  onPressed: () {},
                ),
                hintText: GlobalStrings.typeMessageHere,
                hintStyle: TextStyle(color: GlobalColors.fadeTextColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: GlobalColors.greenTextColor),
          child: InkWell(
            child: Image.asset(
              'assets/icons/voice.png',
              color: GlobalColors.whiteTextColor,
            ),
            onTap: (){

            },
          )
        )
      ],
    );
  }
}
