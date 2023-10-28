import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';
import 'package:gpt/module/settings/settings_controller.dart';
import 'package:gpt/module/settings/settings_page.dart';

class HomeAppBar extends GetWidget<SettingsController> implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              onPressed: (){
                showModalBottomSheet(
                    barrierColor: Colors.transparent.withAlpha(0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const SettingsPage();
                    });
              },
              icon: Icon(FontAwesomeIcons.bars,
                color: GlobalColors.whiteTextColor,)),
          const Spacer(),
          Text(GlobalStrings.appName,
            style: TextStyle(
              color: GlobalColors.whiteTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),).tr(),
          const Spacer(),
        ],
      ),
    );
  }

}