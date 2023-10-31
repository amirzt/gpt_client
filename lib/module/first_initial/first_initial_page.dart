
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/first_initial/faq_page.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
// import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:gpt/module/root/root_page.dart';
import 'package:gpt/services/locale_services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstInitialPage extends StatelessWidget{
  FirstInitialPage({super.key});
  final FirstInitialController controller = FirstInitialController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: GlobalColors.whiteTextColor, fontWeight: FontWeight.bold, fontSize: 18);

    Get.put(FirstInitialController());
    return GetBuilder<FirstInitialController>(
      builder: (controller){
        return SafeArea(
          child: Scaffold(
            backgroundColor: GlobalColors.mainBackgroundColor,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    GlobalStrings.language,
                    style: textStyle,
                  ).tr(),
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
                            child: Row(
                              children: [
                                Text(
                                  GlobalStrings.english,
                                  style: TextStyle(
                                      color: GlobalColors.whiteTextColor,
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Obx(() => Checkbox(
                                  checkColor: GlobalColors.successColor,
                                  shape: const CircleBorder(),
                                  activeColor:
                                  GlobalColors.successColor,
                                  value:
                                  controller.selectedLanguage.value == 0,
                                  onChanged: (bool? value) {  },
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.selectedLanguage.value = 0;
                      EasyLocalization.of(context)
                          ?.setLocale(const Locale('en', 'US'));
                      Get.updateLocale(const Locale('en', 'US'));
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
                            child: Row(
                              children: [
                                Text(
                                  GlobalStrings.persian,
                                  style: TextStyle(
                                      color: GlobalColors.whiteTextColor,
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Obx(() => Checkbox(
                                  checkColor: GlobalColors.successColor,
                                  shape: const CircleBorder(),
                                  activeColor:
                                  GlobalColors.successColor,
                                  value:
                                  controller.selectedLanguage.value == 1,
                                  onChanged: (bool? value) {  },
                                ))

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.selectedLanguage.value = 1;
                      EasyLocalization.of(context)
                          ?.setLocale(const Locale('fa', 'IR'));
                      Get.updateLocale(const Locale('fa', 'IR'));

                    },
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: (){
                      Get.to(const FAQPage());
                    },
                    child: Text(GlobalStrings.FAQAccept,
                      style: TextStyle(
                          color: GlobalColors.whiteTextColor,
                          fontWeight: FontWeight.bold),).tr()
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(255, 50),
                        backgroundColor: GlobalColors.primaryColor
                    ),
                    onPressed: (){
                      Get.to(const RootPage(true));
                    },
                    child: Text(GlobalStrings.continueMessage,
                      style: TextStyle(color: GlobalColors.whiteTextColor, fontSize: 18, fontWeight: FontWeight.bold),).tr()
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        );
      },
    );
  }

  void checkUserLocale(BuildContext context) async{
    if(context.locale == const Locale('fa', 'IR')){
      // print('fa');
      controller.selectedLanguage.value = 1;
    }else{
      // print('en');
      controller.selectedLanguage.value = 0;
    }
    bool isInIran = await LocaleServices.checkIfUserIsInIran(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isInIran', isInIran);
    // print("is in iran ? "+isInIran.toString());
  }

}