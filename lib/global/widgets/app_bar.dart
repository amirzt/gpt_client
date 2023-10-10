
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../module/root/root_controller.dart';

class GlobalAppBar extends GetWidget<RootController> implements PreferredSizeWidget{
  const GlobalAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.chevronLeft,
              color: GlobalColors.black,)),
        ],
      ),
    );
  }

}