
import 'package:flutter/material.dart';
import '../../core/constants.dart';

showErrorDialog(BuildContext context, String errorMessage){
  AlertDialog alert= AlertDialog(
    content: Text(errorMessage),
    title: Text(GlobalStrings.error),
  );
  showDialog(barrierDismissible: true,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}