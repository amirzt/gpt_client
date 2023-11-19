
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirstInitialController extends GetxController{
  var selectedLanguage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAppsLocale();
  }

  void changeLanguage(int position, BuildContext context) {
    selectedLanguage.value = position;
    update();
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


  void setLanguage(int position) {
    selectedLanguage.value = position;
    update();
  }


  void getAppsLocale() {
    switch (Get.locale?.languageCode) {
      case 'en':
        setLanguage(0);
        break;

      case 'fa':
        setLanguage(1);
        break;

      case 'ru':
        setLanguage(2);
        break;

      case 'fil':
        setLanguage(3);
        break;

      case 'ja':
        setLanguage(4);
        break;

      case 'de':
        setLanguage(5);
        break;

      case 'ar':
        setLanguage(6);
        break;

    }

  }

}