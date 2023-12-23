
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/settings/settings_controller.dart';
import 'package:gpt/module/shop/plans/shop_controller.dart';
import 'package:gpt/services/shop_service.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'dart:ui' as ui;

class ShopPage extends GetView<SettingsController>{
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(ShopController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColors.mainBackgroundColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/splash_background.png'),
              // Replace 'assets/background_image.jpg' with your image file
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Image.asset('assets/icons/shop_background.png'),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200.withOpacity(0.3),
                    // Semi-transparent background
                    surfaceTintColor: Colors.grey.shade200.withOpacity(0.3),
                  ),
                  onPressed: () { Get.back(); },
                  icon: Icon(FontAwesomeIcons.xmark,
                    color: GlobalColors.mainBackgroundColor,),

                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140),
                  child: Image.asset('assets/icons/getpro.png'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: SizedBox(
                    height: 75,
                    child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: ScrollLoopAutoScroll(
                          scrollDirection: Axis.horizontal,
                          delay: const Duration(seconds: 0),
                          duration: const Duration(seconds: 100),
                          child: Row(
                            textDirection: ui.TextDirection.rtl,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 32, 36, 45),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: GlobalColors.borderColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/star.png',
                                        width: 30,
                                        height: 30,),
                                      const SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(GlobalStrings.unlimited,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                          Text(GlobalStrings.questions,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 32, 36, 45),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: GlobalColors.borderColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/ad.png',
                                        width: 30,
                                        height: 30,),
                                      const SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(GlobalStrings.addFree,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                          Text(GlobalStrings.removeAds,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 32, 36, 45),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: GlobalColors.borderColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/stars.png',
                                        width: 30,
                                        height: 30,),
                                      const SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(GlobalStrings.moreDetail,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                          Text(GlobalStrings.bestAnswer,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: GlobalColors.whiteTextColor
                                            ),).tr(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 100),
                  child: Obx(() => controller.isLoading.value ?
                  Center(
                    child: MyProgressIndicator(GlobalColors.whiteTextColor),
                  )
                      : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                        itemCount: controller.plans.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 15),
                            child: InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 32, 36, 45),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: GlobalColors.borderColor)
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 30,),
                                      Text(
                                        tr(controller.plans[index].title),
                                        style: TextStyle(
                                            color: GlobalColors.whiteTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.plans[index].price,
                                        style: TextStyle(
                                            color: GlobalColors.whiteTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        GlobalStrings.price,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: GlobalColors.whiteTextColor,
                                            fontSize: 15),
                                      ).tr(),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() =>
                                          Theme(
                                              data: Theme.of(context).copyWith(
                                                  checkboxTheme: const CheckboxThemeData(
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color: Colors.white
                                                          )
                                                      )
                                                  )
                                              ),
                                              child: AbsorbPointer(
                                                child: Checkbox(
                                                    checkColor: const Color.fromARGB(255, 39,136,255),
                                                    shape: const CircleBorder(),
                                                    activeColor:
                                                    GlobalColors.primaryColor,
                                                    value:
                                                    controller.selectedIndex.value == index,
                                                    onChanged: (value) {

                                                    }),
                                              )
                                          )),
                                      const SizedBox(width: 30,),

                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                controller.selectedIndex.value = index;
                              },
                            ),
                          );
                        }),
                  ),),
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 39,136,255),
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.6,
                            65),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                    onPressed: () {
                      ShopService().myketShop(context,
                          controller.plans[controller.selectedIndex.value].myket,
                          controller.plans[controller.selectedIndex.value].id);
                    },
                    child: Text(GlobalStrings.buy,
                      style: TextStyle(
                          fontSize: 16,
                          color: GlobalColors.whiteTextColor,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}