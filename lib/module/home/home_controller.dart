
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/core/urls.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/data/models/plan_model.dart';
import 'package:gpt/provider/api_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  Plan plan = Plan(title: '', price: '0', id: 0, checked: false, myket: '');

  @override
  onInit(){
    super.onInit();
    getAppVersion();
    getSpecialPlan();
  }

  List<Task> recommended = [
    Task(name: 'how to be rich and make money?  ', id: 1, icon: 'assets/icons/money.png', description: 'description', offline: true, script: 'how can i become rich? give me a short answer', firstSend: true),
    Task(name: 'Translate “I love you” to Spanish. ', id: 1, icon: 'assets/icons/spain.png', description: 'description', offline: true, script: 'Translate “I love you” to Spanish.', firstSend: true),
    Task(name: 'what is the capital of iran ', id: 1, icon: 'assets/icons/iran.png', description: 'description', offline: true, script: 'what is the capital of iran', firstSend: true),
    Task(name: 'how long can a horse live? ', id: 1, icon: 'assets/icons/horse.png', description: 'description', offline: true, script: 'how long can a horse live?', firstSend: true),
    Task(name: 'what is the biggest building?', id: 1, icon: 'assets/icons/building.png', description: 'description', offline: true, script: 'what is the biggest building?', firstSend: true),
  ];


  getSpecialPlan() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    plan = await ApiProvider()
        .getSpecialPlans(GlobalURL.getZarinpalPlan,
        {
          'is_special': '1',
          'package_name': packageName
        }
    );
  }

  void getAppVersion() async{
    Map response = await ApiProvider().getAppVersion();
    bool isForce = response['is_force'];
    int version = response['version'];
    // String description = response['description'];

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if(int.parse(packageInfo.buildNumber) < version){
      Get.dialog(
          barrierDismissible: !isForce,
          WillPopScope(
            onWillPop: () async{
              return !isForce;
            },
          child: AlertDialog(
            title: Text(GlobalStrings.update,
                style: TextStyle(color: GlobalColors.whiteTextColor)).tr(),
            content: Text(GlobalStrings.updateDesc,
                style: TextStyle(color: GlobalColors.whiteTextColor)).tr(),
            actions: [
              TextButton(
                onPressed: () {
                  openStore();
                },
                child: Text(GlobalStrings.update,
                  style: TextStyle(color: GlobalColors.whiteTextColor),).tr(),
              ),
            ],
          ),)

      );
    }
  }
  openStore() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    if (Platform.isAndroid) {
      launchUrl(
          Uri.parse(
              'https://play.google.com/store/apps/details?id=$packageName'),
          mode: LaunchMode.externalApplication);
    } else {
      launchUrl(Uri.parse(''), mode: LaunchMode.externalApplication);
    }
  }
}