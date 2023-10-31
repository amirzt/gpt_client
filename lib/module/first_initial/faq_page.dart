

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/core/constants.dart';

class FAQPage extends StatelessWidget{
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(GlobalStrings.FAQ,
                style: TextStyle(
                    color: GlobalColors.whiteTextColor,
                    fontSize: 16
                ),).tr(),
            )
          ],
        ),
      ),
    );
  }

}