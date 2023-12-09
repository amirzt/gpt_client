import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/assisstant_bottom_widget.dart';
import 'package:gpt/module/chat/widgets/message_bottom_widget.dart';
import 'package:gpt/services/locale_services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class GPTMessageWidget extends GetWidget<ChatController> {
  final Message message;
  final int index;

  const GPTMessageWidget(this.message, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 60,
        left: 10,
        top: 10,
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              // border: Border.all(width: 1, color: GlobalColors.borderColor),
              color: GlobalColors.secondBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: LocaleServices().isPersian(message.content.value)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Obx(() => message.content.value == ''
                    ? MyProgressIndicator(GlobalColors.whiteTextColor)
                    : Text(
                        message.content.value,
                        textDirection: LocaleServices()
                            .detectTextDirection(message.content.value),
                        style: TextStyle(color: GlobalColors.whiteTextColor),
                      )),
                const SizedBox(
                  height: 10,
                ),
                AssistantBottomWidget(message, index),
                const SizedBox(height: 10,),
                Obx(() => message.image.value != ''
                    ? Stack(
                  children: [
                    Image.network(message.image.value),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade200.withOpacity(0.3),
                          // Semi-transparent background
                          surfaceTintColor: Colors.grey.shade200.withOpacity(0.3),
                        ),
                        onPressed: (){
                          saveToGallery();
                        },
                        icon: Icon(Icons.save_alt,
                        color: GlobalColors.mainBackgroundColor,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey.shade200.withOpacity(0.3),
                            // Semi-transparent background
                            surfaceTintColor: Colors.grey.shade200.withOpacity(0.3),
                          ),
                          onPressed: (){
                            shareImage();
                          },
                          icon: Icon(Icons.share,
                            color: GlobalColors.mainBackgroundColor,),
                        )
                        ,
                      ),
                    ),
                  ],
                )
                    : controller.visualizingIndex.value == index ?
                controller.isVisualizeLoading.value
                    ? Container(
                  // width: 512,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: GlobalColors.thirdBackgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyProgressIndicator(
                        GlobalColors.whiteTextColor,
                        size: 40,
                      ),
                      const SizedBox(height: 10,),
                      Text('processing...',
                        style: TextStyle(
                            color: GlobalColors.whiteTextColor
                        ),)
                    ],
                  ),
                )
                    : Container()
                    : Container()
                )
              ],
            ),
          )),
    );
  }

  void saveToGallery() async{
    Get.snackbar(tr(GlobalStrings.success), tr(GlobalStrings.savedToGalley));
    http.Response response = await http.get(Uri.parse(message.image.value));
    await ImageGallerySaver.saveImage(response.bodyBytes);
    Get.snackbar(tr(GlobalStrings.success), tr(GlobalStrings.savedToGalley));
  }

  void shareImage() async{
    final file = await DefaultCacheManager().downloadFile(message.image.value);
    await Share.shareXFiles([XFile(file.file.path)], text: '');
  }
}
