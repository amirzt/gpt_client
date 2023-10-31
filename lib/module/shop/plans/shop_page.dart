
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/shop/plans/shop_controller.dart';

class ShopPage extends GetView<ShopController>{
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShopController());
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
                alignment: Alignment.bottomCenter,
                child: Obx(() => controller.isLoading.value ?
                Center(
                  child: MyProgressIndicator(GlobalColors.whiteTextColor),
                )
                    : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                                color: GlobalColors.secondBackgroundColor,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: GlobalColors.borderColor)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
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
                                    Obx(() => Checkbox(
                                        checkColor: GlobalColors.primaryColor,
                                        shape: const CircleBorder(),
                                        activeColor:
                                        GlobalColors.primaryColor,
                                        value:
                                        controller.selectedIndex.value == index,
                                        onChanged: (value) {

                                        }))
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
                ),)
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.primaryColor,
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.6,
                            65),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    ),
                    onPressed: () {
                      controller.getZarinpalUrl();
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