
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/chat_controller.dart';
// import 'package:share_plus/share_plus.dart';

class MessageBottomWidget extends GetWidget<ChatController>{
  final Message message;
  const MessageBottomWidget(this.message, {super.key});

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

    return SizedBox(
      height: 35,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.end,
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton.icon(
            onPressed: () async{
              await Clipboard.setData(ClipboardData(text: message.content.value));
            },
            icon: Icon(Icons.copy,
              color: GlobalColors.whiteTextColor,
              size: 16,
            ),
            label: Text(GlobalStrings.copy,
              style: TextStyle(color: GlobalColors.whiteTextColor,
                  fontSize: 12),).tr(),
            style: style,
          ),
          const SizedBox( width: 10,),
          ElevatedButton.icon(
            onPressed: (){
              controller.reAsk(message);
            },
            icon: Icon(Icons.restart_alt,
              color: GlobalColors.whiteTextColor,
              size: 16,
            ),
            label: Text(GlobalStrings.reAsk,
              style: TextStyle(color: GlobalColors.whiteTextColor,
                  fontSize: 12),).tr(),
            style: style,
          ),
          // ElevatedButton.icon(
          //   onPressed: (){
          //
          //   },
          //   icon: Icon(Icons.restart_alt,
          //     color: GlobalColors.whiteTextColor,
          //     size: 14,
          //   ),
          //   label: Text(GlobalStrings.pin,
          //     style: TextStyle(color: GlobalColors.whiteTextColor,
          //         fontSize: 12),),
          //   style: style,
          // ),
          // ElevatedButton.icon(
          //   onPressed: (){
          //     // Share.share(message.content.value);
          //   },
          //   icon: Icon(Icons.share,
          //     color: GlobalColors.whiteTextColor,
          //     size: 16,
          //   ),
          //   label: Text(GlobalStrings.share,
          //     style: TextStyle(color: GlobalColors.whiteTextColor,
          //         fontSize: 12),),
          //   style: style,
          // ),
        ],
      ),
    );
  }

}