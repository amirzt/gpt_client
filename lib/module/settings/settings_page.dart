import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/settings/settings_controller.dart';

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
                  ),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GlobalColors.mainBackgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        child: Text(
                          GlobalStrings.language,
                          style: textStyle,
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
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        child: Text(
                          GlobalStrings.copyUsername,
                          style: textStyle,
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
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        child: Text(
                          GlobalStrings.privacyPolicy,
                          style: textStyle,
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
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        child: Text(
                          GlobalStrings.contactInfo,
                          style: textStyle,
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
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        child: Text(
                          GlobalStrings.rate,
                          style: textStyle,
                        ),
                        onTap: (){
                          controller.rateUs();
                        },
                      ),
                    ),
                    Divider(
                      color: GlobalColors.divider,
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
