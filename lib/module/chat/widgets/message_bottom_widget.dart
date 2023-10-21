
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';

class MessageBottomWidget extends GetWidget<ChatController>{
  const MessageBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200.withOpacity(0.3), // Semi-transparent background
      surfaceTintColor: Colors.grey.shade200.withOpacity(0.3),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
            onPressed: (){

            },
            icon: Icon(Icons.restart_alt,
              color: GlobalColors.whiteTextColor,
              size: 14,
            ),
            label: Text(GlobalStrings.copy,
              style: TextStyle(color: GlobalColors.whiteTextColor,
                  fontSize: 12),),
          style: style,
        ),
        ElevatedButton.icon(
          onPressed: (){

          },
          icon: Icon(Icons.restart_alt,
            color: GlobalColors.whiteTextColor,
            size: 14,
          ),
          label: Text(GlobalStrings.reAsk,
            style: TextStyle(color: GlobalColors.whiteTextColor,
                fontSize: 12),),
          style: style,
        ),
        ElevatedButton.icon(
          onPressed: (){

          },
          icon: Icon(Icons.restart_alt,
            color: GlobalColors.whiteTextColor,
            size: 14,
          ),
          label: Text(GlobalStrings.pin,
            style: TextStyle(color: GlobalColors.whiteTextColor,
                fontSize: 12),),
          style: style,
        ),
        ElevatedButton.icon(
          onPressed: (){

          },
          icon: Icon(Icons.restart_alt,
            color: GlobalColors.whiteTextColor,
            size: 14,
          ),
          label: Text(GlobalStrings.share,
            style: TextStyle(color: GlobalColors.whiteTextColor,
                fontSize: 12),),
          style: style,
        ),
      ],
    );
  }

}