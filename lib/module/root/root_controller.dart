
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt/module/history/history_page.dart';
import 'package:gpt/module/home/home_page.dart';
import 'package:gpt/module/task/task_page.dart';

class RootController extends GetxController{
  var currentIndex = 0.obs;
  List<Widget> pages = [
    const HomePage(),
    const Taskpage(),
    HistoryPage()
  ];

  PageController pageController = PageController(initialPage: 0);
}