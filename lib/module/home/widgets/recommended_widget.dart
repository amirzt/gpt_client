import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/items_model.dart';
import 'package:gpt/module/home/home_controller.dart';

class RecommendedWidget extends GetWidget<HomeController> {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
