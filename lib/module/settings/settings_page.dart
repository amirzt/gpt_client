import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/first_initial/faq_page.dart';
import 'package:gpt/module/settings/settings_controller.dart';
import 'package:gpt/module/shop/plans/shop_page.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: GlobalColors.whiteTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold);
    Get.put(SettingsController());
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: GlobalColors.secondBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    GlobalStrings.settings,
                    style: TextStyle(
                        color: GlobalColors.whiteTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ).tr(),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: GlobalColors.whiteTextColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    GlobalStrings.leftDays,
                    style: TextStyle(color: GlobalColors.whiteTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ).tr(),
                  Obx(() => Text(
                    " : ${controller.leftDays.value} ",
                    style: TextStyle(color: GlobalColors.whiteTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),),
                  Text(
                    GlobalStrings.day,
                    style: TextStyle(color: GlobalColors.whiteTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ).tr()
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GlobalColors.mainBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.upgrade,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          Get.to(const ShopPage());
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.language,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          controller.changeLanguage(context);
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.copyUsername,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          controller.copyUsername();
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.privacyPolicy,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          Get.to(const FAQPage());
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.contactInfo,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          controller.copyContactInfo();
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: InkWell(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 60,
                          child: Center(
                            child: Text(
                              GlobalStrings.rate,
                              style: textStyle,
                            ).tr(),
                          ),
                        ),
                        onTap: (){
                          controller.rateUs();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
