import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/module/settings/widgets/change_language.dart';
import 'package:gpt/module/settings/widgets/rate_dialog.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  String contactInfo = "contactInfo";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEmail();
  }

  void changeLanguage(BuildContext context) {
    Get.dialog(const ChangeLanguageBottomSheet());
  }

  void rateUs() {
    Get.dialog(const RateUsDialog());
  }

  void copyUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? 'error';

    Clipboard.setData(ClipboardData(text: username));
    Get.snackbar("Success", "Username copied to clipboard",
        colorText: GlobalColors.whiteTextColor);
  }

  void copyContactInfo() {
    Clipboard.setData(ClipboardData(text: contactInfo));
    Get.snackbar("Success", "Contact info copied to clipboard",
        colorText: GlobalColors.whiteTextColor);
  }

  void getEmail() async{
    contactInfo = await ApiProvider().getEmail();
  }
}
