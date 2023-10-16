
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/data/models/items_model.dart';

class RecommendedTaskWidget extends StatelessWidget {
  final Task task;
  const RecommendedTaskWidget(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: GlobalColors.secondPrimaryColor,
        border: Border.all(color: GlobalColors.borderColor, width: 1),
      ),
      child: InkWell(
        onTap: (){

        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: GlobalColors.whiteTextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          GlobalStrings.useCommand,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.blueTextColor,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Icon(
                          FontAwesomeIcons.chevronRight,
                          color: GlobalColors.blueTextColor,
                          size: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: task.offline ? Image.asset(task.icon) : Image.network(task.icon)
              )
            ],
          ),
        ),
      ),
    );
  }
}
