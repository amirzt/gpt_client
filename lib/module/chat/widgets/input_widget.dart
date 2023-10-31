import 'dart:math';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/scan_text_widget.dart';
import 'package:gpt/module/shop/plans/shop_page.dart';
import 'package:gpt/services/locale_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:ui' as ui;

class InputWidget extends GetWidget<ChatController> {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());

    return Obx(() => controller.limitReached.value ?
    const LimitReachedWidget()
    : Row(
      textDirection: ui.TextDirection.ltr,
      children: [
        const SizedBox(
          width: 20,
        ),
        Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Container(
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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(999), // This limits the length of characters
                ],
                decoration: InputDecoration(
                    prefixIcon: controller.textValue.value.isEmpty
                        ? IconButton(
                      icon: Image.asset(
                        'assets/icons/scan.png',
                        color: GlobalColors.whiteTextColor,
                      ),
                      onPressed: () {
                        openGallery();
                      },
                    )
                        : null,
                    hintText: tr(GlobalStrings.typeMessageHere),
                    hintStyle: TextStyle(color: GlobalColors.whiteTextColor),
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none),
              ))),),
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
              child: controller.isMessageLoading.value
                  ? MyProgressIndicator(GlobalColors.whiteTextColor, size: 20,)
                  : Image.asset(
                controller.textValue.value.isEmpty
                    ? 'assets/icons/voice.png'
                    : 'assets/icons/send.png',
                color: GlobalColors.whiteTextColor,
              ),
              onTap: () {
                if (controller.textValue.value.isNotEmpty) {
                  controller.addUserMessage();
                }
              },
              onTapDown: (a) {
                if(controller.textValue.value.isEmpty){
                  if(controller.isMessageLoading.value == false){
                    startRecord();
                  }
                }
              },
              onTapUp: (a) {
                stopRecord();
              },
            )))
      ],
    ));
  }

  void openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      Get.to(ScanTextWidget(imageBytes));
    }
    // final status = await Permission.storage.request();
    // if (status.isGranted) {
    //   final picker = ImagePicker();
    //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //   if (pickedFile != null) {
    //     final imagePath = pickedFile.path;
    //     saveImage(imagePath, type);
    //   }
    // }
  }

  void startRecord() async {
    print('started');
    SpeechToText speech = SpeechToText();
    bool success = await speech.initialize();
    if (success) {
      speech.listen(onResult: onSpeechResult);
      // print('success');
    } else {
      // print('failed');
    }
  }

  void stopRecord() {
    print('stopped');
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    controller.textEditingController.text = result.recognizedWords;
  }

}

class LimitReachedWidget extends StatelessWidget {
  const LimitReachedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(width: 1, color: GlobalColors.borderColor),
          color: GlobalColors.divider),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(GlobalStrings.limitMessage,
                style: TextStyle(
                    color: GlobalColors.whiteTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                ),).tr(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.primaryColor,
                fixedSize:
                Size(
                  MediaQuery.of(context).size.width,
                    60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  ),
                )
              ),
                onPressed: (){
                  Get.to(const ShopPage());
                },
                child: Text(GlobalStrings.goLimitless,
                    style: TextStyle(
                        color: GlobalColors.whiteTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    )).tr()
            )
          ],
        ),
      )
    );
  }
}

