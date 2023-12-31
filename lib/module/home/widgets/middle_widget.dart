import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/module/root/root_controller.dart';

class HomeMiddleWidget extends GetWidget<RootController> {
  const HomeMiddleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Text(
                GlobalStrings.getHelp,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: GlobalColors.whiteTextColor),
              ).tr(),),
              Flexible(
                flex: 2,
                child: ElevatedButton(
                    onPressed: () {
                      controller.currentIndex.value = 1;
                      controller.pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutQuad);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.secondBackgroundColor,
                      // fixedSize: Size(100, 20)
                    ),
                    child: Text(GlobalStrings.tasks,
                      style: TextStyle(
                          fontSize: 14,
                          color: GlobalColors.whiteTextColor,
                          fontWeight: FontWeight.bold
                      ),).tr()
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(255, 6, 173, 122)
                  ),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GlobalStrings.socialMedia,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: GlobalColors.whiteTextColor),
                          ).tr(),
                          const SizedBox(height: 10,),
                          Text(
                            GlobalStrings.socialMediaDesc,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: GlobalColors.whiteTextColor),
                          ).tr(),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/icons/social.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      Get.to(ChatPage(0, false,script: tr(GlobalStrings.socialMediaScript)));
                    },
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 51, 118, 245)
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          GlobalStrings.summary,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        // const SizedBox(height: 10,),
                                        Text(
                                          GlobalStrings.summaryDesc,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        const SizedBox(height: 10,),

                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/summary.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0, false,script: tr(GlobalStrings.summaryScript)));
                            },
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255,238, 119, 10)
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,                                      children: [
                                      Text(
                                        GlobalStrings.studying,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),
                                      Text(
                                        GlobalStrings.studyingDesc,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),

                                    ],
                                    ),),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/studying.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0,false ,script:tr(GlobalStrings.studyScript)));
                            },
                          )
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 10,),
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: GlobalColors.secondBackgroundColor
                  ),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GlobalStrings.health,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: GlobalColors.whiteTextColor),
                          ).tr(),
                          const SizedBox(height: 10,),
                          Text(
                            GlobalStrings.healthDesc,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: GlobalColors.whiteTextColor),
                          ).tr(),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/icons/health.png',
                              width: 48,
                              height: 49,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      Get.to(ChatPage(0, false,script: tr(GlobalStrings.healthScript)));
                    },
                  ),
                ),

                const SizedBox(width: 10,),
                Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: GlobalColors.secondBackgroundColor
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          GlobalStrings.game,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        // const SizedBox(height: 10,),
                                        Text(
                                          GlobalStrings.gameDesc,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        const SizedBox(height: 10,),

                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/game.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0, false,script: tr(GlobalStrings.gameScript)));
                            },
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 6, 173, 122)
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,                                      children: [
                                      Text(
                                        GlobalStrings.video,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),
                                      Text(
                                        GlobalStrings.videoDesc,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),

                                    ],
                                    ),),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/video.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0,false ,script:tr(GlobalStrings.videoScript)));
                            },
                          )
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 10,),
                Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 51, 118, 245)
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          GlobalStrings.coding,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        // const SizedBox(height: 10,),
                                        Text(
                                          GlobalStrings.codingDesc,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: GlobalColors.whiteTextColor),
                                        ).tr(),
                                        const SizedBox(height: 10,),

                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/coding.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0, false,script: tr(GlobalStrings.codingScript)));
                            },
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Flexible(
                      flex: 1,
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255,238, 119, 10)
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,                                      children: [
                                      Text(
                                        GlobalStrings.social,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),
                                      Text(
                                        GlobalStrings.socialDesc,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: GlobalColors.whiteTextColor),
                                      ).tr(),
                                      const SizedBox(height: 10,),

                                    ],
                                    ),),
                                  const Spacer(),
                                  Flexible(
                                      flex: 1,
                                      child: Image.asset('assets/icons/social.png'))
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(ChatPage(0,false ,script:tr(GlobalStrings.socialScript)));
                            },
                          )
                      ),
                    ),
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
