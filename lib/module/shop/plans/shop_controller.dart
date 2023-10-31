
import 'package:get/get.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/data/models/plan_model.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopController extends GetxController{
  List<Plan> plans = [];

  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getZarinpalPlans();
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