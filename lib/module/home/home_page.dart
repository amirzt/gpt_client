
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/module/home/home_controller.dart';
import 'package:gpt/module/home/widgets/middle_widget.dart';
import 'package:gpt/module/home/widgets/recommended_widget.dart';

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
              const HomeMiddleWidget(),
              Text(
                GlobalStrings.recommendedTasks,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: GlobalColors.whiteTextColor),
              ),
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
                Get.to(const ChatPage(0, false));
              },
              child: AbsorbPointer(
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Directionality(
                        textDirection: TextDirection.rtl,
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