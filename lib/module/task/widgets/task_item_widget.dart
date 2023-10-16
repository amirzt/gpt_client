import 'package:flutter/material.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/items_model.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;

  const TaskItemWidget(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: GlobalColors.secondPrimaryColor,
        border: Border.all(color: GlobalColors.borderColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            task.offline ? Image.asset(task.icon) : Image.network(task.icon),
            const SizedBox(
              height: 10,
            ),
            Text(
              task.name,
              style: TextStyle(
                  color: GlobalColors.greenTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              task.description,
              softWrap: true,
              style: TextStyle(
                  color: GlobalColors.whiteTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}
