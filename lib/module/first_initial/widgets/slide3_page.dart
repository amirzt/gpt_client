import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:gpt/module/first_initial/widgets/slide2_page.dart';

class Slide3Page extends StatelessWidget {
  const Slide3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<FirstInitialController>(
      builder: (controller) {
        controller.startThirdAnimations();
        return Scaffold(
          backgroundColor: GlobalColors.mainBackgroundColor,
          body: Stack(
            fit: StackFit.expand,
            children: [

              AnimatedPositioned(
                top: 150,
                // left: 250,
                left: 0,
                right: 0,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 200,
                    right: 50,
                    top: 10,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)
                        ),
                        gradient: LinearGradient(
                          colors: [
                            GlobalColors.bubbleGradientStart,
                            GlobalColors.bubbleGradientStart,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Help me to translate this photo to Korean.',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
              AnimatedPositioned(
                top: 100,
                left: controller.thirdSlideImage.value ? 10 : -500,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                    top: 10,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/hero_book.png',
                            width: 200,
                            height: 200,)
                          ],
                        ),
                      )),
                ),
              ),


              AnimatedPositioned(
                top: 275,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 200,
                    left: 50,
                    top: 80,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)

                          ),
                          // border: Border.all(width: 1, color: GlobalColors.borderColor),
                          color: GlobalColors.secondBackgroundColor),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Write a 5,000 word story for baby sleep',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
              AnimatedPositioned(
                top: 200,
                right: controller.thirdSlideImage.value ? 10 : -500,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 0,
                    // left: 20,
                    top: 80,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                          ),
                          // border: Border.all(width: 1, color: GlobalColors.borderColor),
                          // color: GlobalColors.secondBackgroundColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset('assets/icons/hero-sound.png',
                        width: 200,
                        height: 200,)
                      )),
                ),
              ),

              AnimatedPositioned(
                bottom: controller.thirdSlideImage.value ? 150 : - 200,
                left: 0,
                duration: const Duration(seconds: 1),
                child: const Padding(
                  padding: EdgeInsets.only(left: 50,
                      right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Save The',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text('Time Of Work',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: controller.thirdSlideImage.value ? 30 : - 200,
                left: 0,
                right: 0,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromARGB(255, 39, 136, 255),
                        fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.6, 65),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)))),
                    onPressed: () {
                      // controller.getZarinpalUrl();
                      Get.to(const Slide2Page());
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 16,
                          color: GlobalColors.whiteTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
