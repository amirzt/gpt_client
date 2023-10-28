import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class RateUsDialog extends StatelessWidget {
  const RateUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        GlobalStrings.rate,
        style: TextStyle(color: GlobalColors.whiteTextColor),
      ).tr(),
      content: Text(GlobalStrings.rateDesc,
              style: TextStyle(color: GlobalColors.whiteTextColor))
          .tr(),
      actions: <Widget>[
        ElevatedButton(
            child: Text(
              GlobalStrings.cancel,
              style: TextStyle(color: GlobalColors.mainBackgroundColor),
            ).tr(),
            onPressed: () => Get.back()),
        ElevatedButton(
          child: Text(
            GlobalStrings.rate,
            style: TextStyle(color: GlobalColors.mainBackgroundColor),
          ).tr(),
          onPressed: () => openUrl(),
        ),
      ],
    );
  }

  openUrl() async {
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
