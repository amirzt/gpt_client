import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/services/locale_services.dart';
import 'package:vibration/vibration.dart';
// import 'package:share_plus/share_plus.dart';

class AssistantBottomWidget extends GetWidget<ChatController> {
  final Message message;
  final int index;

  const AssistantBottomWidget(this.message, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200.withOpacity(0.3),
      // Semi-transparent background
      surfaceTintColor: Colors.grey.shade200.withOpacity(0.3),
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      // fixedSize: Size(100, 30)
    );

    return SizedBox(
      height: 35,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.end,
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await Clipboard.setData(
                  ClipboardData(text: message.content.value));
              Vibration.vibrate(duration: 100);
              // Get.snackbar(tr(GlobalStrings.copy), tr(GlobalStrings.success));
            },
            icon: Icon(
              Icons.copy,
              color: GlobalColors.whiteTextColor,
              size: 14,
            ),
            label: Text(
              GlobalStrings.copy,
              style:
                  TextStyle(color: GlobalColors.whiteTextColor, fontSize: 12),
            ).tr(),
            style: style,
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              controller.visualize(index);
            },
            icon: Icon(
              Icons.image_outlined,
              color: GlobalColors.whiteTextColor,
              size: 16,
            ),
            label: Text(
              GlobalStrings.visualize,
              style:
                  TextStyle(color: GlobalColors.whiteTextColor, fontSize: 12),
            ).tr(),
            style: style,
          ),
          const SizedBox(
            width: 10,
          ),

          LocaleServices().isEnglish(message.content.value)
              ? ElevatedButton.icon(
                  onPressed: () {
                    controller.speakingIndex.value = index;
                    if (controller.isBTS.value) {
                      controller.flutterTts.pause();
                      controller.isBTS.value = false;
                    } else {
                      startVoice();
                    }
                  },
                  icon: Icon(
                    Icons.keyboard_voice,
                    color: GlobalColors.whiteTextColor,
                    size: 16,
                  ),
                  label: Obx(
                    () => Text(
                      controller.speakingIndex.value == index ?
                      controller.isBTS.value
                          ? GlobalStrings.pause
                          : GlobalStrings.listen
                      : GlobalStrings.listen,
                      style: TextStyle(
                          color: GlobalColors.whiteTextColor, fontSize: 12),
                    ).tr(),
                  ),
                  style: style,
                )
              : Container()
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

  void startVoice() async {
    controller.isBTS.value = true;
    controller.flutterTts.speak(message.content.value);
  }
}
