import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';

class UserMessageWidget extends GetWidget<GetxController> {
  final Message message;

  const UserMessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                message.content,
                style: TextStyle(color: GlobalColors.whiteTextColor),
              ),
              
            ],
          ),
        ));
  }
}
