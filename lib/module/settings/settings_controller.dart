import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/data/models/plan_model.dart';
import 'package:gpt/module/settings/widgets/change_language.dart';
import 'package:gpt/module/settings/widgets/rate_dialog.dart';
import 'package:gpt/module/shop/plans/shop_controller.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  String contactInfo = "contactInfo";
  var selectedLanguage = 0.obs;

  List<Plan> plans = [];

  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getZarinpalPlans();
    getEmail();
    Get.put(ShopController());

  }

  void changeLanguage(BuildContext context) {
    // Get.dialog(const ChangeLanguageBottomSheet());
    Get.to(const ChangeLanguageBottomSheet());
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



  void getZarinpalPlans() async{
    isLoading.value = true;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    plans = await ApiProvider().getPlans(GlobalURL.getZarinpalPlan,
        {'package_name': packageName}
    );
    // plans[0].checked = true;
    isLoading.value = false;
  }

  void getZarinpalUrl() async{
    isLoading.value = true;
    String url = await ApiProvider().getZarinpalUrl(plans[selectedIndex.value].id);
    // url = "/api/shop/request/";
    Uri uri = Uri.http('193.36.84.224:8001', '/api/shop/request/',parseQueryString(url.substring(1)) );
    launchUrl(
        uri,
        mode: LaunchMode.externalApplication
    );
    // print(uri);
    isLoading.value = false;
  }

  Map<String, dynamic> parseQueryString(String queryString) {
    Map<String, String> queryParams = {};

    // Split the input string by '&' to get individual key-value pairs
    List<String> pairs = queryString.split('&');

    // Loop through each pair and split by '=' to get key and value
    for (String pair in pairs) {
      // Split the pair into key and value
      List<String> keyValue = pair.split('=');

      // Check if the pair is in correct format (contains key and value)
      if (keyValue.length == 2) {
        // Decode key and value and add them to the map
        String key = keyValue[0];
        String value = keyValue[1];
        queryParams[key] = value;
      }
    }
    print(queryParams);
    return queryParams;
  }

}
