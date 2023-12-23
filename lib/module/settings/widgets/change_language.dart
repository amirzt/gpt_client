import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/global/widgets/app_bar.dart';
import 'package:gpt/module/settings/settings_controller.dart';

class ChangeLanguageBottomSheet extends GetWidget<SettingsController> {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600
    );
    getAppsLocale();
    return Scaffold(
        appBar: const GlobalAppBar(),
        body: Padding(
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
                        Image.asset('assets/icons/uk.png',
                        width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('English', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 0 ?
                        Icon(Icons.done,
                        color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(0, context);
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
                        Image.asset('assets/icons/ir.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('فارسی', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 1 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(1, context);
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
                        Image.asset('assets/icons/ru.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('Pусский', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 2 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(2, context);
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
                        Image.asset('assets/icons/ph.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('Filipino', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 3 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(3, context);
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
                        Image.asset('assets/icons/jp.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('日本語', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 4 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(4, context);
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
                        Image.asset('assets/icons/du.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('Deutsch', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 5 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(5, context);
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
                        Image.asset('assets/icons/ar.png',
                          width: 24, height: 24,),
                        const SizedBox(width: 10,),
                        Text('عربي', style: textStyle,),
                        const Spacer(),
                        Obx(() => controller.selectedLanguage.value == 6 ?
                        Icon(Icons.done,
                          color: GlobalColors.successColor,
                          size: 18,) : Container())
                      ],
                    ),
                  ),
                  onTap: (){
                    changeLanguage(6, context);
                  },
                ),

              ],
            ),
          ),
        ),

    );

  }

  void changeLanguage(int position, BuildContext context) {
    controller.selectedLanguage.value = position;
    switch (position) {
      case 0:
        EasyLocalization.of(context)
                            ?.setLocale(const Locale('en', 'US'));
                        Get.updateLocale(const Locale('en', 'US'));
        break;

      case 1:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('fa', 'IR'));
        Get.updateLocale(const Locale('fa', 'IR'));
        break;

      case 2:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('ru', 'RU'));
        Get.updateLocale(const Locale('ru', 'RU'));
        break;

      case 3:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('fil', 'PH'));
        Get.updateLocale(const Locale('fil', 'PH'));
        break;

      case 4:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('ja', 'JP'));
        Get.updateLocale(const Locale('ja', 'JP'));
        break;

      case 5:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('de', 'DE'));
        Get.updateLocale(const Locale('de', 'DE'));
        break;

      case 6:
        EasyLocalization.of(context)
            ?.setLocale(const Locale('ar', 'SA'));
        Get.updateLocale(const Locale('ar', 'SA'));
        break;

    }
  }

  void getAppsLocale() {
    switch (Get.locale?.languageCode) {
      case 'en':
        controller.selectedLanguage.value = 0;
        break;

      case 'fa':
        controller.selectedLanguage.value = 1;
        break;

      case 'ru':
        controller.selectedLanguage.value = 2;
        break;

      case 'fil':
        controller.selectedLanguage.value = 3;
        break;

      case 'ja':
        controller.selectedLanguage.value = 4;
        break;

      case 'de':
        controller.selectedLanguage.value = 5;
        break;

      case 'ar':
        controller.selectedLanguage.value = 6;
        break;

    }

  }
}
