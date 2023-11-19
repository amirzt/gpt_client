
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/plan_model.dart';
import 'package:gpt/module/shop/special_offer/special_offer_controller.dart';

class SpecialOfferPage extends GetView<SpecialOfferController>{
  final Plan plan;
  const SpecialOfferPage(this.plan, {super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SpecialOfferController());
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
              Image.asset('assets/icons/special_background.png'),
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
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(GlobalStrings.unlockLifeTime,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: GlobalColors.whiteTextColor
                    ),).tr(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                      "${tr(GlobalStrings.fullPrice)} ${plan.price} ${tr(GlobalStrings.yearly)}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: GlobalColors.whiteTextColor
                      )
                  ),
                ),
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
                      controller.getZarinpalUrl(plan.id);
                    },
                    child: Text(GlobalStrings.getLifeTimePro,
                    style: TextStyle(
                      fontSize: 16,
                      color: GlobalColors.whiteTextColor,
                      fontWeight: FontWeight.w700
                    ),).tr(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: GlobalColors.secondBackgroundColor,
                          border: Border.all(color: GlobalColors.borderColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        GlobalColors.bubbleGradientStart,
                                        GlobalColors.bubbleGradientEnd,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )
                                ),
                                child: Icon(Icons.done,
                                  color: GlobalColors.mainBackgroundColor,),
                              ),
                              const SizedBox(width: 10,),
                              Text(GlobalStrings.fastProcessing,
                                style: TextStyle(
                                    color: GlobalColors.bodyTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),).tr()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: GlobalColors.secondBackgroundColor,
                          border: Border.all(color: GlobalColors.borderColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        GlobalColors.bubbleGradientStart,
                                        GlobalColors.bubbleGradientEnd,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )
                                ),
                                child: Icon(Icons.done,
                                  color: GlobalColors.mainBackgroundColor,),
                              ),
                              const SizedBox(width: 10,),
                              Text(GlobalStrings.advanceTool,
                                style: TextStyle(
                                    color: GlobalColors.bodyTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),).tr()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: GlobalColors.secondBackgroundColor,
                          border: Border.all(color: GlobalColors.borderColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        GlobalColors.bubbleGradientStart,
                                        GlobalColors.bubbleGradientEnd,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )
                                ),
                                child: Icon(Icons.done,
                                  color: GlobalColors.mainBackgroundColor,),
                              ),
                              const SizedBox(width: 10,),
                              Text(GlobalStrings.removeAds,
                                style: TextStyle(
                                    color: GlobalColors.bodyTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),).tr()
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: GlobalColors.secondBackgroundColor,
                          border: Border.all(color: GlobalColors.borderColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        GlobalColors.bubbleGradientStart,
                                        GlobalColors.bubbleGradientEnd,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )
                                ),
                                child: Icon(Icons.done,
                                  color: GlobalColors.mainBackgroundColor,),
                              ),
                              const SizedBox(width: 10,),
                              Text(GlobalStrings.getCredit,
                                style: TextStyle(
                                    color: GlobalColors.bodyTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),).tr()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Text(GlobalStrings.billedYearly,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: GlobalColors.whiteTextColor
                  ),).tr(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 130),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(plan.price,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: GlobalColors.whiteTextColor
                        ),),
                      const SizedBox(width: 10,),
                      Text(GlobalStrings.perYear,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: GlobalColors.whiteTextColor
                        ),).tr()
                    ],
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