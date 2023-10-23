
import 'package:get/get.dart';
import 'package:gpt/module/root/root_page.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() async{
    // Future.delayed(const Duration(seconds: 1), () {
    //   Get.to(const RootPage());
    // });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    bool success = await ApiProvider().login();
    if(success){
      Get.off(const RootPage());
    }else{
      Get.off(const RootPage());
    }
    // try{
    //   if(prefs.containsKey('Token')){
    //     bool success = await ApiProvider().login();
    //     if(success){
    //       Get.off(const RootPage());
    //     }else{
    //       Get.off(const RootPage());
    //     }
    //   }else{
    //     await ApiProvider().login();
    //     // Get.off(const FirstInitialPage());
    //   }
    // }catch(e){
    //   Get.off(const RootPage());
    // }

  }

}