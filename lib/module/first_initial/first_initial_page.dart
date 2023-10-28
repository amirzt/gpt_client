
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/first_initial/first_initial_controller.dart';
import 'package:lottie/lottie.dart';

class FirstInitialPage extends GetWidget<FirstInitialController>{
  const FirstInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FirstInitialController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Lottie.asset('assets/animations/task.json')
          ],
        ),
      )
    );
  }

}