import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/global/widgets/progress_indicator.dart';
import 'package:gpt/module/home/home_controller.dart';
import 'package:gpt/module/shop/special_offer/special_offer_page.dart';
import 'package:gpt/module/task/task_controller.dart';
import 'package:gpt/module/task/widgets/categories_widget.dart';
import 'package:gpt/module/task/widgets/task_item_widget.dart';

class Taskpage extends GetView<TaskController> {
  const Taskpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskController());
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
            height: 60,
            child: Obx(() => controller.isCategoryLoading.value
                ? MyProgressIndicator(GlobalColors.whiteTextColor)
                : const CategoriesWidget())),
        Padding(
          padding: const EdgeInsets.all(0),
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
                    Flexible(
                      flex: 1,
                      child: Image.asset('assets/icons/gift.png'),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      flex: 3,
                      child: Column(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: (){
              HomeController homeController = Get.find<HomeController>();
              Get.to(SpecialOfferPage(homeController.plan));
            },
          ),

        ),
        Expanded(
          child: Obx(() => controller.isTaskLoading.value
              ? MyProgressIndicator(GlobalColors.whiteTextColor)
              : GridView.builder(
                  itemCount: controller.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width / (400),
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    return TaskItemWidget(controller.items[index]);
                  },
                )
          ),
        )
      ],
    ));
  }
}
