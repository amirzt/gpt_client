
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:gpt/module/first_initial/first_initial_page.dart';
import 'package:gpt/module/root/root_page.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:gpt/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin{

  var isBottomVisible = false.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 3),
    );
    // animationController.forward();
    // repeatAnim();
    getUserInfo();
  }

  void getUserInfo() async{
    // bool success = await ApiProvider().login();
    // if(success){
    //   Get.off(const RootPage(true));
    // }else{
    //   Get.off(const RootPage(false));
    // }

    // Future.delayed(const Duration(seconds: 1), () {
    //   Get.to(const RootPage());
    // });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      if(prefs.containsKey('Token')){
        bool success = await ApiProvider().login();
        if(success){
          Get.off(const RootPage(true));
        }else{
          Get.off(const RootPage(false));
        }
      }else{
        await ApiProvider().login();
        Get.off(FirstInitialPage());
      }
    }catch(e){
      Get.off(const RootPage(false));
    }
    // isBottomVisible.value = false;
    // animationController.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     if(success){
    //       Get.off(const RootPage());
    //     }else{
    //       Get.off(const RootPage());
    //     }
    //   }
    // });
    // animationController.forward();
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

  void repeatAnim() async{
    await Future.delayed(const Duration(seconds: 1));
    isBottomVisible.value = true;
    animationController.forward();
    getUserInfo();
  }

}