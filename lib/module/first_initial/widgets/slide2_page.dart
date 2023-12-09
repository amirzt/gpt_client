import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:gpt/module/first_initial/first_initial_page.dart';
import 'package:gpt/module/root/root_page.dart';

class Slide2Page extends StatelessWidget {
  const Slide2Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(FirstInitialController());

    return GetBuilder<FirstInitialController>(
      builder: (controller) {
        controller.startSecondAnimations();
        return Scaffold(
          backgroundColor: GlobalColors.mainBackgroundColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedPositioned(
                  left: 0,
                  right: 0,
                  top: controller.secondSlideImage.value ? 0 : -100,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Image.asset('assets/icons/third_hero.png')),

              AnimatedPositioned(
                top: controller.firstSlideImage.value ?
                MediaQuery.of(context).size.height * 0.5 - 30
                : MediaQuery.of(context).size.height * 0.5,
                  left: 0,
                right: 0,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 80,
                    left: 50,
                    top: 50,
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
                        child: Column(
                          children: [
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Alexander',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white
                                ),),
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Color.fromARGB(255, 39, 136, 255),),
                                    Icon(Icons.star,color: Color.fromARGB(255, 39, 136, 255),),
                                    Icon(Icons.star,color: Color.fromARGB(255, 39, 136, 255),),
                                    Icon(Icons.star,color: Color.fromARGB(255, 39, 136, 255),),
                                    Icon(Icons.star,color: Color.fromARGB(255, 39, 136, 255),),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('Great app! I love the user-friendly interface and how easy it is to navigate.',
                            textDirection: TextDirection.ltr,
                              style: TextStyle(color: Colors.white),)
                          ],
                        )
                      )),
                ),
              ),


              AnimatedPositioned(
                bottom: controller.secondSlideImage.value ? 150 : - 200,
                left: 0,
                duration: const Duration(seconds: 1),
                child: const Padding(
                  padding: EdgeInsets.only(left: 50,
                      right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Trusted By',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text('Many People',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: controller.secondSlideImage.value ? 30 : - 200,
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
                      // Get.to(const Slide2Page());
                      Get.off(FirstInitialPage());
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
