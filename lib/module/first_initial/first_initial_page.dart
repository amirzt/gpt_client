
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/first_initial/faq_page.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
// import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:gpt/module/root/root_page.dart';
import 'package:gpt/services/locale_services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstInitialPage extends StatelessWidget{
  FirstInitialPage({super.key});
  final FirstInitialController controller = FirstInitialController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: GlobalColors.whiteTextColor, fontWeight: FontWeight.bold, fontSize: 18);

    Get.put(FirstInitialController());

    return GetBuilder<FirstInitialController>(
      builder: (controller){
        return SafeArea(
          child: Scaffold(
            backgroundColor: GlobalColors.mainBackgroundColor,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    GlobalStrings.language,
                    style: textStyle,
                  ).tr(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(width: 2, color: GlobalColors.borderColor),
                        color: GlobalColors.divider),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('English', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 0 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(0, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('فارسی', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 1 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(1, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('Pусский', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 2 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(2, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('Filipino', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 3 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(3, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('日本語', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 4 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(4, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('Deutsch', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 5 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(5, context);
                          },
                        ),
                        Divider(
                            color: GlobalColors.borderColor,
                            thickness: 2),

                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 30, right: 30),
                            child: Row(
                              children: [
                                Text('عربي', style: textStyle,),
                                const Spacer(),
                                controller.selectedLanguage.value == 6 ?
                                Icon(Icons.done,
                                  color: GlobalColors.successColor,
                                  size: 18,) : Container()
                              ],
                            ),
                          ),
                          onTap: (){
                            controller.changeLanguage(6, context);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: (){
                      Get.to(const FAQPage());
                    },
                    child: Text(GlobalStrings.FAQAccept,
                      style: TextStyle(
                          color: GlobalColors.blueTextColor,
                          fontWeight: FontWeight.bold),).tr()
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(255, 50),
                        backgroundColor: GlobalColors.primaryColor
                    ),
                    onPressed: (){
                      Get.offAll(const RootPage(true));
                    },
                    child: Text(GlobalStrings.continueMessage,
                      style: TextStyle(color: GlobalColors.whiteTextColor, fontSize: 18, fontWeight: FontWeight.bold),).tr()
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        );
      },
    );
  }

  void getAppsLocale() {
    switch (Get.locale?.languageCode) {
      case 'en':
        controller.setLanguage(0);
        break;

      case 'fa':
        controller.setLanguage(1);
        break;

      case 'ru':
        controller.setLanguage(2);
        break;

      case 'fil':
        controller.setLanguage(3);
        break;

      case 'ja':
        controller.setLanguage(4);
        break;

      case 'de':
        controller.setLanguage(5);
        break;

      case 'ar':
        controller.setLanguage(6);
        break;

    }

  }


}