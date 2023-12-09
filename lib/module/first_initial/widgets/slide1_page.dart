import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:gpt/module/first_initial/widgets/slide3_page.dart';

class Slide1Page extends StatelessWidget {
  const Slide1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FirstInitialController());

    return GetBuilder<FirstInitialController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: GlobalColors.mainBackgroundColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedPositioned(
                  left: 0,
                  right: 0,
                  top: controller.firstSlideImage.value ? 0 : -500,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Image.asset('assets/icons/hero-image.png')),
              // const SizedBox(
              //   height: 10,
              // ),
              AnimatedPositioned(
                top: MediaQuery.of(context).size.height * 0.4,
                right: controller.firstSlideImage.value ? 10 : -500,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 10,
                    top: 10,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Write a content for iran history',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              AnimatedPositioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: controller.firstSlideImage.value ? 10 : -500,
                duration: const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 60,
                    left: 10,
                    top: 80,
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
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '''Irans history is a rich tapestry
woven withancient civilizations,
cultural diversity,and significant
historical events.Spanning thousands
of years, Irans history has shaped
its identity, culture, and
place in the world
''',
                          softWrap: true,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),

              AnimatedPositioned(
                bottom: controller.firstSlideImage.value ? 120 : - 200,
                left: 0,
                duration: const Duration(seconds: 1),
                child: const Padding(
                  padding: EdgeInsets.only(left: 50,
                  right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AI Assistant',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text('In Your Pocket',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: controller.firstSlideImage.value ? 30 : - 200,
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
                      Get.to(const Slide3Page());
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
