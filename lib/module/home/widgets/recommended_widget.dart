import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/module/chat/widgets/input_widget.dart';
import 'package:gpt/module/home/home_controller.dart';

class RecommendedWidget extends GetWidget<HomeController> {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              Expanded(
                child: ListView.builder(
                    itemCount: controller.recommended.length,
                    itemBuilder: (context, index) {
                      return RecommendedItem(controller.recommended[index]);
                    }),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Get.to(const ChatPage());
              },
              child: AbsorbPointer(
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
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
                              hintStyle: TextStyle(color: GlobalColors.whiteTextColor,),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none),
                        )
                    ),
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
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  final Task task;

  const RecommendedItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: GlobalColors.secondBackgroundColor,
          border: Border.all(color: GlobalColors.borderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  Text(task.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: GlobalColors.whiteTextColor,
                        fontSize: 16
                    ),),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Text(
                            GlobalStrings.useCommand,
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalColors.blueTextColor,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(width: 6,),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        color: GlobalColors.blueTextColor,
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Image.asset(task.icon)
            ],
          ),
        ),
      ),
    );
  }
}
