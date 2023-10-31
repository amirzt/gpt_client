
import 'package:get/get.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecialOfferController extends GetxController{

  void getZarinpalUrl(int id) async{
    // isLoading.value = true;
    String url = await ApiProvider().getZarinpalUrl(id);
    // url = "/api/shop/request/";
    Uri uri = Uri.http('193.36.84.224:8001', '/api/shop/request/',parseQueryString(url.substring(1)) );
    launchUrl(
        uri,
        mode: LaunchMode.externalApplication
    );
    // print(uri);
    // isLoading.value = false;
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