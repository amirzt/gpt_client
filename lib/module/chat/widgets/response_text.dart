
import 'package:flutter/material.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/services/locale_services.dart';

class ResponseText extends StatelessWidget {
  final String code;
  const ResponseText(this.code, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containsCode(code) ?
    Text(code)
    : Text(code,
      textDirection: LocaleServices()
          .detectTextDirection(code),
      style: TextStyle(color: GlobalColors.whiteTextColor),);
  }

  bool containsCode(String code) {
    return false;
  }
}
