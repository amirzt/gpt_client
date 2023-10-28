
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';

showErrorDialog(BuildContext context, String errorMessage){
  AlertDialog alert= AlertDialog(
    content: Text(errorMessage),
    title: Text(GlobalStrings.error).tr(),
  );
  showDialog(barrierDismissible: true,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}