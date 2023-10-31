
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/module/home/home_controller.dart';
import 'package:gpt/module/home/widgets/middle_widget.dart';
import 'package:gpt/module/home/widgets/recommended_widget.dart';
import 'package:gpt/module/shop/plans/shop_page.dart';
import 'dart:ui' as ui;

import 'package:gpt/module/shop/special_offer/special_offer_page.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: GlobalColors.mainBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/icons/buy_background.png'),
                          fit: BoxFit.fill
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(

                        children: [
                          Image.asset('assets/icons/gift.png'),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              Text(GlobalStrings.specialOffer,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: GlobalColors.whiteTextColor
                                ),).tr(),
                              const SizedBox(height: 10,),
                              Text(GlobalStrings.specialOfferDesc,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: GlobalColors.whiteTextColor
                                  )
                              ).tr()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Get.to(SpecialOfferPage(controller.plan));
                  },
                ),

              ),
              const HomeMiddleWidget(),
              Text(
                GlobalStrings.recommendedTasks,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: GlobalColors.whiteTextColor),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.recommended.length,
                  itemBuilder: (context, index) {
                    return RecommendedItem(controller.recommended[index]);
                  }),
              const SizedBox(height: 100,)
            ],
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Get.to(ChatPage(0, false));
              },
              child: AbsorbPointer(
                child: Row(
                  textDirection: ui.TextDirection.ltr,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Directionality(
                        textDirection: ui.TextDirection.rtl,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: GlobalColors.divider),
                            child: TextFormField(
                              // controller: controller.textEditingController,
                              style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                              ),
                              // textDirection: LocaleServices()
                              //     .detectTextDirection(controller.textValue.value),
                              // textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/icons/scan.png',
                                      color: GlobalColors.whiteTextColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                  hintText: GlobalStrings.typeMessageHere,
                                  hintStyle: TextStyle(
                                    color: GlobalColors.whiteTextColor,),
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none),
                            )
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: GlobalColors.greenTextColor),
                        child: InkWell(
                          child: Image.asset(
                            'assets/icons/voice.png',
                            color: GlobalColors.whiteTextColor,
                          ),
                          onTap: () {
                          },
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }

}