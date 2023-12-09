
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:gpt/module/chat/widgets/scan_text_widget.dart';
import 'package:image_picker/image_picker.dart';

class CameraGalleyBottomSheet extends StatelessWidget {
  const CameraGalleyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        builder: (controller){
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: GlobalColors.secondBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      child: const Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: Row(
                            children: [
                              Text('Camera',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),),
                              Spacer(),
                              Icon(Icons.camera_alt_outlined,
                                size: 20,
                                color: Colors.white,)
                            ]
                        ),
                      ),
                      onTap: (){
                        captureImage();
                      },
                    ),
                    const SizedBox(height: 10,),
                    Divider(height: 1,
                    color: GlobalColors.divider,),
                    InkWell(
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Row(
                            children: [
                              Text('Gallery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),),
                              Spacer(),
                              Icon(Icons.photo_library_outlined,
                                size: 20,
                                color: Colors.white,)
                            ]
                        ),
                      ),
                      onTap: (){
                        openGallery();
                      },
                    )
                  ],
                ),
              )

            ),
          );
        }
    );
  }

  void openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      Get.to(ScanTextWidget(imageBytes));
    }
  }

  Future<void> captureImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      Get.to(ScanTextWidget(imageBytes));
    } else {
      // print('No image selected.');
    }
  }

}
