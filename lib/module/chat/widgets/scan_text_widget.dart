
import 'dart:io';
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_controller.dart';
import 'package:path_provider/path_provider.dart';

class ScanTextWidget extends GetWidget<ChatController>{
  final Uint8List image;
  const ScanTextWidget(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    final cropController = CropController();

    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            child: Crop(
                controller: cropController,
                image: image,
                onCropped: (croppedImage){
                  // print('croped');
                  recognizeText(croppedImage);
                }
            ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: (){
                cropController.crop();
                // recognizeText(cropController.);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.bubbleGradientEnd,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 50)
              ),
              child: Text(GlobalStrings.cropAndRecognize,
              style: TextStyle(color: GlobalColors.whiteTextColor
              , fontSize: 16,
              fontWeight: FontWeight.bold),)
          ),
          const SizedBox(height: 10,)
        ],
      ),
    ));
  }

  void recognizeText(Uint8List croppedImage) async{
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    var filepath = "${appDocDirectory.path}/temp.png";
    File imgFile = File(filepath);
    imgFile.writeAsBytes(croppedImage);

    final inputImage = InputImage.fromFile(imgFile);

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    controller.textEditingController.text = text;
    Get.back();
    // controller.textEditingController.text = text;
    // for (TextBlock block in recognizedText.blocks) {
    //   final Rect rect = block.boundingBox;
    //   final List<Point<int>> cornerPoints = block.cornerPoints;
    //   final String text = block.text;
    //   final List<String> languages = block.recognizedLanguages;
    //
    //   for (TextLine line in block.lines) {
    //     // Same getters as TextBlock
    //     for (TextElement element in line.elements) {
    //       // Same getters as TextBlock
    //     }
    //   }
    // }

    textRecognizer.close();
  }

}