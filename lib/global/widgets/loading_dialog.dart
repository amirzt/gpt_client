
import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context){
  AlertDialog alert=const AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        // Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
      ],),
  );
  showDialog(barrierDismissible: true,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}