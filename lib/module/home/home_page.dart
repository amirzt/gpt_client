
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/home/home_controller.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: Text('test test test'),
      ),
    );
  }

}