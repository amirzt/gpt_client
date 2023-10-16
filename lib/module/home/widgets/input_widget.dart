
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class InputWidget extends GetWidget<ChatController>{
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Image.asset('assets/icon1.png'),
                  onPressed: () {},
                ),
                hintText: GlobalStrings.typeMessageHere,
                hintStyle: TextStyle(color: GlobalColors.fadeTextColor),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/icon2.png'),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }

}