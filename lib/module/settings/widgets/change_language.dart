
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/settings/settings_controller.dart';

class ChangeLanguageBottomSheet extends GetWidget<SettingsController> {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: GlobalColors.whiteTextColor, fontWeight: FontWeight.bold, fontSize: 18);

    return Dialog(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: GlobalColors.mainBackgroundColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  GlobalStrings.language,
                  style: textStyle,
                ).tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Divider(
                  height: 2,
                  color: GlobalColors.divider,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            GlobalStrings.english,
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    EasyLocalization.of(context)
                        ?.setLocale(const Locale('en', 'US'));
                    Get.updateLocale(const Locale('en', 'US'));
                    Get.back();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            GlobalStrings.persian,
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    EasyLocalization.of(context)
                        ?.setLocale(const Locale('fa', 'IR'));
                    Get.updateLocale(const Locale('fa', 'IR'));
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}